/*******************************************************************************************************************
Copyright (c) 2023 Cycling '74

The code that Max generates automatically and that end users are capable of
exporting and using, and any associated documentation files (the “Software”)
is a work of authorship for which Cycling '74 is the author and owner for
copyright purposes.

This Software is dual-licensed either under the terms of the Cycling '74
License for Max-Generated Code for Export, or alternatively under the terms
of the General Public License (GPL) Version 3. You may use the Software
according to either of these licenses as it is most appropriate for your
project on a case-by-case basis (proprietary or not).

A) Cycling '74 License for Max-Generated Code for Export

A license is hereby granted, free of charge, to any person obtaining a copy
of the Software (“Licensee”) to use, copy, modify, merge, publish, and
distribute copies of the Software, and to permit persons to whom the Software
is furnished to do so, subject to the following conditions:

The Software is licensed to Licensee for all uses that do not include the sale,
sublicensing, or commercial distribution of software that incorporates this
source code. This means that the Licensee is free to use this software for
educational, research, and prototyping purposes, to create musical or other
creative works with software that incorporates this source code, or any other
use that does not constitute selling software that makes use of this source
code. Commercial distribution also includes the packaging of free software with
other paid software, hardware, or software-provided commercial services.

For entities with UNDER $200k in annual revenue or funding, a license is hereby
granted, free of charge, for the sale, sublicensing, or commercial distribution
of software that incorporates this source code, for as long as the entity's
annual revenue remains below $200k annual revenue or funding.

For entities with OVER $200k in annual revenue or funding interested in the
sale, sublicensing, or commercial distribution of software that incorporates
this source code, please send inquiries to licensing@cycling74.com.

The above copyright notice and this license shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Please see
https://support.cycling74.com/hc/en-us/articles/10730637742483-RNBO-Export-Licensing-FAQ
for additional information

B) General Public License Version 3 (GPLv3)
Details of the GPLv3 license can be found at: https://www.gnu.org/licenses/gpl-3.0.html
*******************************************************************************************************************/

#ifdef RNBO_LIB_PREFIX
#define STR_IMPL(A) #A
#define STR(A) STR_IMPL(A)
#define RNBO_LIB_INCLUDE(X) STR(RNBO_LIB_PREFIX/X)
#else
#define RNBO_LIB_INCLUDE(X) #X
#endif // RNBO_LIB_PREFIX
#ifdef RNBO_INJECTPLATFORM
#define RNBO_USECUSTOMPLATFORM
#include RNBO_INJECTPLATFORM
#endif // RNBO_INJECTPLATFORM

#include RNBO_LIB_INCLUDE(RNBO_Common.h)
#include RNBO_LIB_INCLUDE(RNBO_AudioSignal.h)

namespace RNBO {


#define trunc(x) ((Int)(x))
#define autoref auto&

#if defined(__GNUC__) || defined(__clang__)
    #define RNBO_RESTRICT __restrict__
#elif defined(_MSC_VER)
    #define RNBO_RESTRICT __restrict
#endif

#define FIXEDSIZEARRAYINIT(...) { }

template <class ENGINE = INTERNALENGINE> class rnbomatic : public PatcherInterfaceImpl {

friend class EngineCore;
friend class Engine;
friend class MinimalEngine<>;
public:

rnbomatic()
: _internalEngine(this)
{
}

~rnbomatic()
{
    deallocateSignals();
}

Index getNumMidiInputPorts() const {
    return 0;
}

void processMidiEvent(MillisecondTime , int , ConstByteArray , Index ) {}

Index getNumMidiOutputPorts() const {
    return 0;
}

void process(
    const SampleValue * const* inputs,
    Index numInputs,
    SampleValue * const* outputs,
    Index numOutputs,
    Index n
) {
    this->vs = n;
    this->updateTime(this->getEngine()->getCurrentTime(), (ENGINE*)nullptr, true);
    SampleValue * out1 = (numOutputs >= 1 && outputs[0] ? outputs[0] : this->dummyBuffer);
    SampleValue * out2 = (numOutputs >= 2 && outputs[1] ? outputs[1] : this->dummyBuffer);
    const SampleValue * in1 = (numInputs >= 1 && inputs[0] ? inputs[0] : this->zeroBuffer);
    const SampleValue * in2 = (numInputs >= 2 && inputs[1] ? inputs[1] : this->zeroBuffer);
    this->linetilde_01_perform(this->signals[0], n);
    this->signalsend_01_perform(this->signals[0], this->signals[1], n);
    this->signalreceive_02_perform(this->signals[1], this->signals[0], n);
    this->linetilde_02_perform(this->signals[1], n);
    this->signalsend_02_perform(this->signals[1], this->signals[2], n);
    this->signalreceive_01_perform(this->signals[2], this->signals[1], n);
    this->dspexpr_03_perform(in1, this->signals[0], this->signals[2], n);

    this->gen_01_perform(
        in1,
        in2,
        this->gen_01_decay,
        this->gen_01_sample_rate_reduction,
        this->signals[3],
        this->signals[4],
        n
    );

    this->dspexpr_01_perform(this->signals[3], this->signals[1], this->signals[5], n);
    this->signaladder_01_perform(this->signals[5], this->signals[2], out1, n);
    this->dspexpr_02_perform(this->signals[4], this->signals[1], this->signals[2], n);
    this->dspexpr_04_perform(in2, this->signals[0], this->signals[1], n);
    this->signaladder_02_perform(this->signals[1], this->signals[2], out2, n);
    this->stackprotect_perform(n);
    this->globaltransport_advance();
    this->advanceTime((ENGINE*)nullptr);
    this->audioProcessSampleCount += this->vs;
}

void prepareToProcess(number sampleRate, Index maxBlockSize, bool force) {
    RNBO_ASSERT(this->_isInitialized);

    if (this->maxvs < maxBlockSize || !this->didAllocateSignals) {
        Index i;

        for (i = 0; i < 6; i++) {
            this->signals[i] = resizeSignal(this->signals[i], this->maxvs, maxBlockSize);
        }

        this->globaltransport_tempo = resizeSignal(this->globaltransport_tempo, this->maxvs, maxBlockSize);
        this->globaltransport_state = resizeSignal(this->globaltransport_state, this->maxvs, maxBlockSize);
        this->zeroBuffer = resizeSignal(this->zeroBuffer, this->maxvs, maxBlockSize);
        this->dummyBuffer = resizeSignal(this->dummyBuffer, this->maxvs, maxBlockSize);
        this->didAllocateSignals = true;
    }

    const bool sampleRateChanged = sampleRate != this->sr;
    const bool maxvsChanged = maxBlockSize != this->maxvs;
    const bool forceDSPSetup = sampleRateChanged || maxvsChanged || force;

    if (sampleRateChanged || maxvsChanged) {
        this->vs = maxBlockSize;
        this->maxvs = maxBlockSize;
        this->sr = sampleRate;
        this->invsr = 1 / sampleRate;
    }

    this->gen_01_dspsetup(forceDSPSetup);
    this->globaltransport_dspsetup(forceDSPSetup);

    if (sampleRateChanged)
        this->onSampleRateChanged(sampleRate);
}

number msToSamps(MillisecondTime ms, number sampleRate) {
    return ms * sampleRate * 0.001;
}

MillisecondTime sampsToMs(SampleIndex samps) {
    return samps * (this->invsr * 1000);
}

Index getNumInputChannels() const {
    return 2;
}

Index getNumOutputChannels() const {
    return 2;
}

DataRef* getDataRef(DataRefIndex index)  {
    switch (index) {
    case 0:
        {
        return addressOf(this->gen_01_delay_1_bufferobj);
        break;
        }
    case 1:
        {
        return addressOf(this->gen_01_delay_2_bufferobj);
        break;
        }
    case 2:
        {
        return addressOf(this->gen_01_delay_3_bufferobj);
        break;
        }
    case 3:
        {
        return addressOf(this->gen_01_delay_4_bufferobj);
        break;
        }
    case 4:
        {
        return addressOf(this->gen_01_delay_5_bufferobj);
        break;
        }
    case 5:
        {
        return addressOf(this->gen_01_delay_6_bufferobj);
        break;
        }
    case 6:
        {
        return addressOf(this->gen_01_delay_7_bufferobj);
        break;
        }
    case 7:
        {
        return addressOf(this->gen_01_delay_8_bufferobj);
        break;
        }
    case 8:
        {
        return addressOf(this->gen_01_delay_9_bufferobj);
        break;
        }
    case 9:
        {
        return addressOf(this->gen_01_delay_10_bufferobj);
        break;
        }
    case 10:
        {
        return addressOf(this->gen_01_delay_11_bufferobj);
        break;
        }
    case 11:
        {
        return addressOf(this->gen_01_delay_12_bufferobj);
        break;
        }
    case 12:
        {
        return addressOf(this->gen_01_delay_13_bufferobj);
        break;
        }
    case 13:
        {
        return addressOf(this->gen_01_delay_14_bufferobj);
        break;
        }
    case 14:
        {
        return addressOf(this->gen_01_delay_15_bufferobj);
        break;
        }
    case 15:
        {
        return addressOf(this->gen_01_delay_16_bufferobj);
        break;
        }
    case 16:
        {
        return addressOf(this->gen_01_delay_17_bufferobj);
        break;
        }
    case 17:
        {
        return addressOf(this->gen_01_delay_18_bufferobj);
        break;
        }
    case 18:
        {
        return addressOf(this->gen_01_delay_19_bufferobj);
        break;
        }
    case 19:
        {
        return addressOf(this->gen_01_delay_20_bufferobj);
        break;
        }
    case 20:
        {
        return addressOf(this->gen_01_delay_21_bufferobj);
        break;
        }
    case 21:
        {
        return addressOf(this->gen_01_delay_22_bufferobj);
        break;
        }
    case 22:
        {
        return addressOf(this->gen_01_delay_23_bufferobj);
        break;
        }
    case 23:
        {
        return addressOf(this->gen_01_delay_24_bufferobj);
        break;
        }
    case 24:
        {
        return addressOf(this->gen_01_delay_25_bufferobj);
        break;
        }
    case 25:
        {
        return addressOf(this->gen_01_delay_26_bufferobj);
        break;
        }
    case 26:
        {
        return addressOf(this->gen_01_delay_27_bufferobj);
        break;
        }
    case 27:
        {
        return addressOf(this->gen_01_delay_28_bufferobj);
        break;
        }
    case 28:
        {
        return addressOf(this->RNBODefaultSinus);
        break;
        }
    default:
        {
        return nullptr;
        }
    }
}

DataRefIndex getNumDataRefs() const {
    return 29;
}

void processDataViewUpdate(DataRefIndex index, MillisecondTime time) {
    this->updateTime(time, (ENGINE*)nullptr);

    if (index == 0) {
        this->gen_01_delay_1_buffer = reInitDataView(this->gen_01_delay_1_buffer, this->gen_01_delay_1_bufferobj);
    }

    if (index == 1) {
        this->gen_01_delay_2_buffer = reInitDataView(this->gen_01_delay_2_buffer, this->gen_01_delay_2_bufferobj);
    }

    if (index == 2) {
        this->gen_01_delay_3_buffer = reInitDataView(this->gen_01_delay_3_buffer, this->gen_01_delay_3_bufferobj);
    }

    if (index == 3) {
        this->gen_01_delay_4_buffer = reInitDataView(this->gen_01_delay_4_buffer, this->gen_01_delay_4_bufferobj);
    }

    if (index == 4) {
        this->gen_01_delay_5_buffer = reInitDataView(this->gen_01_delay_5_buffer, this->gen_01_delay_5_bufferobj);
    }

    if (index == 5) {
        this->gen_01_delay_6_buffer = reInitDataView(this->gen_01_delay_6_buffer, this->gen_01_delay_6_bufferobj);
    }

    if (index == 6) {
        this->gen_01_delay_7_buffer = reInitDataView(this->gen_01_delay_7_buffer, this->gen_01_delay_7_bufferobj);
    }

    if (index == 7) {
        this->gen_01_delay_8_buffer = reInitDataView(this->gen_01_delay_8_buffer, this->gen_01_delay_8_bufferobj);
    }

    if (index == 8) {
        this->gen_01_delay_9_buffer = reInitDataView(this->gen_01_delay_9_buffer, this->gen_01_delay_9_bufferobj);
    }

    if (index == 9) {
        this->gen_01_delay_10_buffer = reInitDataView(this->gen_01_delay_10_buffer, this->gen_01_delay_10_bufferobj);
    }

    if (index == 10) {
        this->gen_01_delay_11_buffer = reInitDataView(this->gen_01_delay_11_buffer, this->gen_01_delay_11_bufferobj);
    }

    if (index == 11) {
        this->gen_01_delay_12_buffer = reInitDataView(this->gen_01_delay_12_buffer, this->gen_01_delay_12_bufferobj);
    }

    if (index == 12) {
        this->gen_01_delay_13_buffer = reInitDataView(this->gen_01_delay_13_buffer, this->gen_01_delay_13_bufferobj);
    }

    if (index == 13) {
        this->gen_01_delay_14_buffer = reInitDataView(this->gen_01_delay_14_buffer, this->gen_01_delay_14_bufferobj);
    }

    if (index == 14) {
        this->gen_01_delay_15_buffer = reInitDataView(this->gen_01_delay_15_buffer, this->gen_01_delay_15_bufferobj);
    }

    if (index == 15) {
        this->gen_01_delay_16_buffer = reInitDataView(this->gen_01_delay_16_buffer, this->gen_01_delay_16_bufferobj);
    }

    if (index == 16) {
        this->gen_01_delay_17_buffer = reInitDataView(this->gen_01_delay_17_buffer, this->gen_01_delay_17_bufferobj);
    }

    if (index == 17) {
        this->gen_01_delay_18_buffer = reInitDataView(this->gen_01_delay_18_buffer, this->gen_01_delay_18_bufferobj);
    }

    if (index == 18) {
        this->gen_01_delay_19_buffer = reInitDataView(this->gen_01_delay_19_buffer, this->gen_01_delay_19_bufferobj);
    }

    if (index == 19) {
        this->gen_01_delay_20_buffer = reInitDataView(this->gen_01_delay_20_buffer, this->gen_01_delay_20_bufferobj);
    }

    if (index == 20) {
        this->gen_01_delay_21_buffer = reInitDataView(this->gen_01_delay_21_buffer, this->gen_01_delay_21_bufferobj);
    }

    if (index == 21) {
        this->gen_01_delay_22_buffer = reInitDataView(this->gen_01_delay_22_buffer, this->gen_01_delay_22_bufferobj);
    }

    if (index == 22) {
        this->gen_01_delay_23_buffer = reInitDataView(this->gen_01_delay_23_buffer, this->gen_01_delay_23_bufferobj);
    }

    if (index == 23) {
        this->gen_01_delay_24_buffer = reInitDataView(this->gen_01_delay_24_buffer, this->gen_01_delay_24_bufferobj);
    }

    if (index == 24) {
        this->gen_01_delay_25_buffer = reInitDataView(this->gen_01_delay_25_buffer, this->gen_01_delay_25_bufferobj);
    }

    if (index == 25) {
        this->gen_01_delay_26_buffer = reInitDataView(this->gen_01_delay_26_buffer, this->gen_01_delay_26_bufferobj);
    }

    if (index == 26) {
        this->gen_01_delay_27_buffer = reInitDataView(this->gen_01_delay_27_buffer, this->gen_01_delay_27_bufferobj);
    }

    if (index == 27) {
        this->gen_01_delay_28_buffer = reInitDataView(this->gen_01_delay_28_buffer, this->gen_01_delay_28_bufferobj);
    }

    if (index == 28) {
        this->gen_01_cycle_233_buffer = reInitDataView(this->gen_01_cycle_233_buffer, this->RNBODefaultSinus);
        this->gen_01_cycle_241_buffer = reInitDataView(this->gen_01_cycle_241_buffer, this->RNBODefaultSinus);
        this->gen_01_cycle_249_buffer = reInitDataView(this->gen_01_cycle_249_buffer, this->RNBODefaultSinus);
        this->gen_01_cycle_257_buffer = reInitDataView(this->gen_01_cycle_257_buffer, this->RNBODefaultSinus);
    }
}

void initialize() {
    RNBO_ASSERT(!this->_isInitialized);

    this->gen_01_delay_1_bufferobj = initDataRef(
        this->gen_01_delay_1_bufferobj,
        this->dataRefStrings->name0,
        true,
        this->dataRefStrings->file0,
        this->dataRefStrings->tag0
    );

    this->gen_01_delay_2_bufferobj = initDataRef(
        this->gen_01_delay_2_bufferobj,
        this->dataRefStrings->name1,
        true,
        this->dataRefStrings->file1,
        this->dataRefStrings->tag1
    );

    this->gen_01_delay_3_bufferobj = initDataRef(
        this->gen_01_delay_3_bufferobj,
        this->dataRefStrings->name2,
        true,
        this->dataRefStrings->file2,
        this->dataRefStrings->tag2
    );

    this->gen_01_delay_4_bufferobj = initDataRef(
        this->gen_01_delay_4_bufferobj,
        this->dataRefStrings->name3,
        true,
        this->dataRefStrings->file3,
        this->dataRefStrings->tag3
    );

    this->gen_01_delay_5_bufferobj = initDataRef(
        this->gen_01_delay_5_bufferobj,
        this->dataRefStrings->name4,
        true,
        this->dataRefStrings->file4,
        this->dataRefStrings->tag4
    );

    this->gen_01_delay_6_bufferobj = initDataRef(
        this->gen_01_delay_6_bufferobj,
        this->dataRefStrings->name5,
        true,
        this->dataRefStrings->file5,
        this->dataRefStrings->tag5
    );

    this->gen_01_delay_7_bufferobj = initDataRef(
        this->gen_01_delay_7_bufferobj,
        this->dataRefStrings->name6,
        true,
        this->dataRefStrings->file6,
        this->dataRefStrings->tag6
    );

    this->gen_01_delay_8_bufferobj = initDataRef(
        this->gen_01_delay_8_bufferobj,
        this->dataRefStrings->name7,
        true,
        this->dataRefStrings->file7,
        this->dataRefStrings->tag7
    );

    this->gen_01_delay_9_bufferobj = initDataRef(
        this->gen_01_delay_9_bufferobj,
        this->dataRefStrings->name8,
        true,
        this->dataRefStrings->file8,
        this->dataRefStrings->tag8
    );

    this->gen_01_delay_10_bufferobj = initDataRef(
        this->gen_01_delay_10_bufferobj,
        this->dataRefStrings->name9,
        true,
        this->dataRefStrings->file9,
        this->dataRefStrings->tag9
    );

    this->gen_01_delay_11_bufferobj = initDataRef(
        this->gen_01_delay_11_bufferobj,
        this->dataRefStrings->name10,
        true,
        this->dataRefStrings->file10,
        this->dataRefStrings->tag10
    );

    this->gen_01_delay_12_bufferobj = initDataRef(
        this->gen_01_delay_12_bufferobj,
        this->dataRefStrings->name11,
        true,
        this->dataRefStrings->file11,
        this->dataRefStrings->tag11
    );

    this->gen_01_delay_13_bufferobj = initDataRef(
        this->gen_01_delay_13_bufferobj,
        this->dataRefStrings->name12,
        true,
        this->dataRefStrings->file12,
        this->dataRefStrings->tag12
    );

    this->gen_01_delay_14_bufferobj = initDataRef(
        this->gen_01_delay_14_bufferobj,
        this->dataRefStrings->name13,
        true,
        this->dataRefStrings->file13,
        this->dataRefStrings->tag13
    );

    this->gen_01_delay_15_bufferobj = initDataRef(
        this->gen_01_delay_15_bufferobj,
        this->dataRefStrings->name14,
        true,
        this->dataRefStrings->file14,
        this->dataRefStrings->tag14
    );

    this->gen_01_delay_16_bufferobj = initDataRef(
        this->gen_01_delay_16_bufferobj,
        this->dataRefStrings->name15,
        true,
        this->dataRefStrings->file15,
        this->dataRefStrings->tag15
    );

    this->gen_01_delay_17_bufferobj = initDataRef(
        this->gen_01_delay_17_bufferobj,
        this->dataRefStrings->name16,
        true,
        this->dataRefStrings->file16,
        this->dataRefStrings->tag16
    );

    this->gen_01_delay_18_bufferobj = initDataRef(
        this->gen_01_delay_18_bufferobj,
        this->dataRefStrings->name17,
        true,
        this->dataRefStrings->file17,
        this->dataRefStrings->tag17
    );

    this->gen_01_delay_19_bufferobj = initDataRef(
        this->gen_01_delay_19_bufferobj,
        this->dataRefStrings->name18,
        true,
        this->dataRefStrings->file18,
        this->dataRefStrings->tag18
    );

    this->gen_01_delay_20_bufferobj = initDataRef(
        this->gen_01_delay_20_bufferobj,
        this->dataRefStrings->name19,
        true,
        this->dataRefStrings->file19,
        this->dataRefStrings->tag19
    );

    this->gen_01_delay_21_bufferobj = initDataRef(
        this->gen_01_delay_21_bufferobj,
        this->dataRefStrings->name20,
        true,
        this->dataRefStrings->file20,
        this->dataRefStrings->tag20
    );

    this->gen_01_delay_22_bufferobj = initDataRef(
        this->gen_01_delay_22_bufferobj,
        this->dataRefStrings->name21,
        true,
        this->dataRefStrings->file21,
        this->dataRefStrings->tag21
    );

    this->gen_01_delay_23_bufferobj = initDataRef(
        this->gen_01_delay_23_bufferobj,
        this->dataRefStrings->name22,
        true,
        this->dataRefStrings->file22,
        this->dataRefStrings->tag22
    );

    this->gen_01_delay_24_bufferobj = initDataRef(
        this->gen_01_delay_24_bufferobj,
        this->dataRefStrings->name23,
        true,
        this->dataRefStrings->file23,
        this->dataRefStrings->tag23
    );

    this->gen_01_delay_25_bufferobj = initDataRef(
        this->gen_01_delay_25_bufferobj,
        this->dataRefStrings->name24,
        true,
        this->dataRefStrings->file24,
        this->dataRefStrings->tag24
    );

    this->gen_01_delay_26_bufferobj = initDataRef(
        this->gen_01_delay_26_bufferobj,
        this->dataRefStrings->name25,
        true,
        this->dataRefStrings->file25,
        this->dataRefStrings->tag25
    );

    this->gen_01_delay_27_bufferobj = initDataRef(
        this->gen_01_delay_27_bufferobj,
        this->dataRefStrings->name26,
        true,
        this->dataRefStrings->file26,
        this->dataRefStrings->tag26
    );

    this->gen_01_delay_28_bufferobj = initDataRef(
        this->gen_01_delay_28_bufferobj,
        this->dataRefStrings->name27,
        true,
        this->dataRefStrings->file27,
        this->dataRefStrings->tag27
    );

    this->RNBODefaultSinus = initDataRef(
        this->RNBODefaultSinus,
        this->dataRefStrings->name28,
        true,
        this->dataRefStrings->file28,
        this->dataRefStrings->tag28
    );

    this->assign_defaults();
    this->applyState();
    this->gen_01_delay_1_bufferobj->setIndex(0);
    this->gen_01_delay_1_buffer = new Float64Buffer(this->gen_01_delay_1_bufferobj);
    this->gen_01_delay_2_bufferobj->setIndex(1);
    this->gen_01_delay_2_buffer = new Float64Buffer(this->gen_01_delay_2_bufferobj);
    this->gen_01_delay_3_bufferobj->setIndex(2);
    this->gen_01_delay_3_buffer = new Float64Buffer(this->gen_01_delay_3_bufferobj);
    this->gen_01_delay_4_bufferobj->setIndex(3);
    this->gen_01_delay_4_buffer = new Float64Buffer(this->gen_01_delay_4_bufferobj);
    this->gen_01_delay_5_bufferobj->setIndex(4);
    this->gen_01_delay_5_buffer = new Float64Buffer(this->gen_01_delay_5_bufferobj);
    this->gen_01_delay_6_bufferobj->setIndex(5);
    this->gen_01_delay_6_buffer = new Float64Buffer(this->gen_01_delay_6_bufferobj);
    this->gen_01_delay_7_bufferobj->setIndex(6);
    this->gen_01_delay_7_buffer = new Float64Buffer(this->gen_01_delay_7_bufferobj);
    this->gen_01_delay_8_bufferobj->setIndex(7);
    this->gen_01_delay_8_buffer = new Float64Buffer(this->gen_01_delay_8_bufferobj);
    this->gen_01_delay_9_bufferobj->setIndex(8);
    this->gen_01_delay_9_buffer = new Float64Buffer(this->gen_01_delay_9_bufferobj);
    this->gen_01_delay_10_bufferobj->setIndex(9);
    this->gen_01_delay_10_buffer = new Float64Buffer(this->gen_01_delay_10_bufferobj);
    this->gen_01_delay_11_bufferobj->setIndex(10);
    this->gen_01_delay_11_buffer = new Float64Buffer(this->gen_01_delay_11_bufferobj);
    this->gen_01_delay_12_bufferobj->setIndex(11);
    this->gen_01_delay_12_buffer = new Float64Buffer(this->gen_01_delay_12_bufferobj);
    this->gen_01_delay_13_bufferobj->setIndex(12);
    this->gen_01_delay_13_buffer = new Float64Buffer(this->gen_01_delay_13_bufferobj);
    this->gen_01_delay_14_bufferobj->setIndex(13);
    this->gen_01_delay_14_buffer = new Float64Buffer(this->gen_01_delay_14_bufferobj);
    this->gen_01_delay_15_bufferobj->setIndex(14);
    this->gen_01_delay_15_buffer = new Float64Buffer(this->gen_01_delay_15_bufferobj);
    this->gen_01_delay_16_bufferobj->setIndex(15);
    this->gen_01_delay_16_buffer = new Float64Buffer(this->gen_01_delay_16_bufferobj);
    this->gen_01_delay_17_bufferobj->setIndex(16);
    this->gen_01_delay_17_buffer = new Float64Buffer(this->gen_01_delay_17_bufferobj);
    this->gen_01_delay_18_bufferobj->setIndex(17);
    this->gen_01_delay_18_buffer = new Float64Buffer(this->gen_01_delay_18_bufferobj);
    this->gen_01_delay_19_bufferobj->setIndex(18);
    this->gen_01_delay_19_buffer = new Float64Buffer(this->gen_01_delay_19_bufferobj);
    this->gen_01_delay_20_bufferobj->setIndex(19);
    this->gen_01_delay_20_buffer = new Float64Buffer(this->gen_01_delay_20_bufferobj);
    this->gen_01_delay_21_bufferobj->setIndex(20);
    this->gen_01_delay_21_buffer = new Float64Buffer(this->gen_01_delay_21_bufferobj);
    this->gen_01_delay_22_bufferobj->setIndex(21);
    this->gen_01_delay_22_buffer = new Float64Buffer(this->gen_01_delay_22_bufferobj);
    this->gen_01_delay_23_bufferobj->setIndex(22);
    this->gen_01_delay_23_buffer = new Float64Buffer(this->gen_01_delay_23_bufferobj);
    this->gen_01_delay_24_bufferobj->setIndex(23);
    this->gen_01_delay_24_buffer = new Float64Buffer(this->gen_01_delay_24_bufferobj);
    this->gen_01_delay_25_bufferobj->setIndex(24);
    this->gen_01_delay_25_buffer = new Float64Buffer(this->gen_01_delay_25_bufferobj);
    this->gen_01_delay_26_bufferobj->setIndex(25);
    this->gen_01_delay_26_buffer = new Float64Buffer(this->gen_01_delay_26_bufferobj);
    this->gen_01_delay_27_bufferobj->setIndex(26);
    this->gen_01_delay_27_buffer = new Float64Buffer(this->gen_01_delay_27_bufferobj);
    this->gen_01_delay_28_bufferobj->setIndex(27);
    this->gen_01_delay_28_buffer = new Float64Buffer(this->gen_01_delay_28_bufferobj);
    this->RNBODefaultSinus->setIndex(28);
    this->gen_01_cycle_233_buffer = new SampleBuffer(this->RNBODefaultSinus);
    this->gen_01_cycle_241_buffer = new SampleBuffer(this->RNBODefaultSinus);
    this->gen_01_cycle_249_buffer = new SampleBuffer(this->RNBODefaultSinus);
    this->gen_01_cycle_257_buffer = new SampleBuffer(this->RNBODefaultSinus);
    this->initializeObjects();
    this->allocateDataRefs();
    this->startup();
    this->_isInitialized = true;
}

void getPreset(PatcherStateInterface& preset) {
    this->updateTime(this->getEngine()->getCurrentTime(), (ENGINE*)nullptr);
    preset["__presetid"] = "rnbo";
    this->param_01_getPresetValue(getSubState(preset, "dry_wet"));
    this->param_02_getPresetValue(getSubState(preset, "clock_speed"));
    this->param_03_getPresetValue(getSubState(preset, "decay"));
}

void setPreset(MillisecondTime time, PatcherStateInterface& preset) {
    this->updateTime(time, (ENGINE*)nullptr);
    this->param_01_setPresetValue(getSubState(preset, "dry_wet"));
    this->param_02_setPresetValue(getSubState(preset, "clock_speed"));
    this->param_03_setPresetValue(getSubState(preset, "decay"));
}

void setParameterValue(ParameterIndex index, ParameterValue v, MillisecondTime time) {
    this->updateTime(time, (ENGINE*)nullptr);

    switch (index) {
    case 0:
        {
        this->param_01_value_set(v);
        break;
        }
    case 1:
        {
        this->param_02_value_set(v);
        break;
        }
    case 2:
        {
        this->param_03_value_set(v);
        break;
        }
    }
}

void processParameterEvent(ParameterIndex index, ParameterValue value, MillisecondTime time) {
    this->setParameterValue(index, value, time);
}

void processParameterBangEvent(ParameterIndex index, MillisecondTime time) {
    this->setParameterValue(index, this->getParameterValue(index), time);
}

void processNormalizedParameterEvent(ParameterIndex index, ParameterValue value, MillisecondTime time) {
    this->setParameterValueNormalized(index, value, time);
}

ParameterValue getParameterValue(ParameterIndex index)  {
    switch (index) {
    case 0:
        {
        return this->param_01_value;
        }
    case 1:
        {
        return this->param_02_value;
        }
    case 2:
        {
        return this->param_03_value;
        }
    default:
        {
        return 0;
        }
    }
}

ParameterIndex getNumSignalInParameters() const {
    return 0;
}

ParameterIndex getNumSignalOutParameters() const {
    return 0;
}

ParameterIndex getNumParameters() const {
    return 3;
}

ConstCharPointer getParameterName(ParameterIndex index) const {
    switch (index) {
    case 0:
        {
        return "dry_wet";
        }
    case 1:
        {
        return "clock_speed";
        }
    case 2:
        {
        return "decay";
        }
    default:
        {
        return "bogus";
        }
    }
}

ConstCharPointer getParameterId(ParameterIndex index) const {
    switch (index) {
    case 0:
        {
        return "dry_wet";
        }
    case 1:
        {
        return "clock_speed";
        }
    case 2:
        {
        return "decay";
        }
    default:
        {
        return "bogus";
        }
    }
}

void getParameterInfo(ParameterIndex index, ParameterInfo * info) const {
    {
        switch (index) {
        case 0:
            {
            info->type = ParameterTypeNumber;
            info->initialValue = 1;
            info->min = 0;
            info->max = 1;
            info->exponent = 1;
            info->steps = 0;
            info->debug = false;
            info->saveable = true;
            info->transmittable = true;
            info->initialized = true;
            info->visible = true;
            info->displayName = "";
            info->unit = "";
            info->ioType = IOTypeUndefined;
            info->signalIndex = INVALID_INDEX;
            break;
            }
        case 1:
            {
            info->type = ParameterTypeNumber;
            info->initialValue = 0.6;
            info->min = 0;
            info->max = 1;
            info->exponent = 1;
            info->steps = 0;
            info->debug = false;
            info->saveable = true;
            info->transmittable = true;
            info->initialized = true;
            info->visible = true;
            info->displayName = "";
            info->unit = "";
            info->ioType = IOTypeUndefined;
            info->signalIndex = INVALID_INDEX;
            break;
            }
        case 2:
            {
            info->type = ParameterTypeNumber;
            info->initialValue = 0.7;
            info->min = 0;
            info->max = 1;
            info->exponent = 1;
            info->steps = 0;
            info->debug = false;
            info->saveable = true;
            info->transmittable = true;
            info->initialized = true;
            info->visible = true;
            info->displayName = "";
            info->unit = "";
            info->ioType = IOTypeUndefined;
            info->signalIndex = INVALID_INDEX;
            break;
            }
        }
    }
}

ParameterValue applyStepsToNormalizedParameterValue(ParameterValue normalizedValue, int steps) const {
    if (steps == 1) {
        if (normalizedValue > 0) {
            normalizedValue = 1.;
        }
    } else {
        ParameterValue oneStep = (number)1. / (steps - 1);
        ParameterValue numberOfSteps = rnbo_fround(normalizedValue / oneStep * 1 / (number)1) * (number)1;
        normalizedValue = numberOfSteps * oneStep;
    }

    return normalizedValue;
}

ParameterValue convertToNormalizedParameterValue(ParameterIndex index, ParameterValue value) const {
    switch (index) {
    case 0:
    case 1:
    case 2:
        {
        {
            value = (value < 0 ? 0 : (value > 1 ? 1 : value));
            ParameterValue normalizedValue = (value - 0) / (1 - 0);
            return normalizedValue;
        }
        }
    default:
        {
        return value;
        }
    }
}

ParameterValue convertFromNormalizedParameterValue(ParameterIndex index, ParameterValue value) const {
    value = (value < 0 ? 0 : (value > 1 ? 1 : value));

    switch (index) {
    case 0:
    case 1:
    case 2:
        {
        {
            {
                return 0 + value * (1 - 0);
            }
        }
        }
    default:
        {
        return value;
        }
    }
}

ParameterValue constrainParameterValue(ParameterIndex index, ParameterValue value) const {
    switch (index) {
    case 0:
        {
        return this->param_01_value_constrain(value);
        }
    case 1:
        {
        return this->param_02_value_constrain(value);
        }
    case 2:
        {
        return this->param_03_value_constrain(value);
        }
    default:
        {
        return value;
        }
    }
}

void processNumMessage(MessageTag , MessageTag , MillisecondTime , number ) {}

void processListMessage(MessageTag , MessageTag , MillisecondTime , const list& ) {}

void processBangMessage(MessageTag , MessageTag , MillisecondTime ) {}

MessageTagInfo resolveTag(MessageTag tag) const {
    switch (tag) {

    }

    return "";
}

MessageIndex getNumMessages() const {
    return 0;
}

const MessageInfo& getMessageInfo(MessageIndex index) const {
    switch (index) {

    }

    return NullMessageInfo;
}

protected:

		
void advanceTime(EXTERNALENGINE*) {}
void advanceTime(INTERNALENGINE*) {
	_internalEngine.advanceTime(sampstoms(this->vs));
}

void processInternalEvents(MillisecondTime time) {
	_internalEngine.processEventsUntil(time);
}

void updateTime(MillisecondTime time, INTERNALENGINE*, bool inProcess = false) {
	if (time == TimeNow) time = getPatcherTime();
	processInternalEvents(inProcess ? time + sampsToMs(this->vs) : time);
	updateTime(time, (EXTERNALENGINE*)nullptr);
}

rnbomatic* operator->() {
    return this;
}
const rnbomatic* operator->() const {
    return this;
}
rnbomatic* getTopLevelPatcher() {
    return this;
}

void cancelClockEvents()
{
    getEngine()->flushClockEvents(this, -281953904, false);
    getEngine()->flushClockEvents(this, -1841075377, false);
}

template<typename LISTTYPE = list> void listquicksort(LISTTYPE& arr, LISTTYPE& sortindices, Int l, Int h, bool ascending) {
    if (l < h) {
        Int p = (Int)(this->listpartition(arr, sortindices, l, h, ascending));
        this->listquicksort(arr, sortindices, l, p - 1, ascending);
        this->listquicksort(arr, sortindices, p + 1, h, ascending);
    }
}

template<typename LISTTYPE = list> Int listpartition(LISTTYPE& arr, LISTTYPE& sortindices, Int l, Int h, bool ascending) {
    number x = arr[(Index)h];
    Int i = (Int)(l - 1);

    for (Int j = (Int)(l); j <= h - 1; j++) {
        bool asc = (bool)((bool)(ascending) && arr[(Index)j] <= x);
        bool desc = (bool)((bool)(!(bool)(ascending)) && arr[(Index)j] >= x);

        if ((bool)(asc) || (bool)(desc)) {
            i++;
            this->listswapelements(arr, i, j);
            this->listswapelements(sortindices, i, j);
        }
    }

    i++;
    this->listswapelements(arr, i, h);
    this->listswapelements(sortindices, i, h);
    return i;
}

template<typename LISTTYPE = list> void listswapelements(LISTTYPE& arr, Int a, Int b) {
    auto tmp = arr[(Index)a];
    arr[(Index)a] = arr[(Index)b];
    arr[(Index)b] = tmp;
}

UInt64 currentsampletime() {
    return this->audioProcessSampleCount + this->sampleOffsetIntoNextAudioBuffer;
}

number mstosamps(MillisecondTime ms) {
    return ms * this->sr * 0.001;
}

inline number linearinterp(number frac, number x, number y) {
    return x + (y - x) * frac;
}

inline number cubicinterp(number a, number w, number x, number y, number z) {
    number a1 = 1. + a;
    number aa = a * a1;
    number b = 1. - a;
    number b1 = 2. - a;
    number bb = b * b1;
    number fw = -.1666667 * bb * a;
    number fx = .5 * bb * a1;
    number fy = .5 * aa * b1;
    number fz = -.1666667 * aa * b;
    return w * fw + x * fx + y * fy + z * fz;
}

inline number fastcubicinterp(number a, number w, number x, number y, number z) {
    number a2 = a * a;
    number f0 = z - y - w + x;
    number f1 = w - x - f0;
    number f2 = y - w;
    number f3 = x;
    return f0 * a * a2 + f1 * a2 + f2 * a + f3;
}

inline number splineinterp(number a, number w, number x, number y, number z) {
    number a2 = a * a;
    number f0 = -0.5 * w + 1.5 * x - 1.5 * y + 0.5 * z;
    number f1 = w - 2.5 * x + 2 * y - 0.5 * z;
    number f2 = -0.5 * w + 0.5 * y;
    return f0 * a * a2 + f1 * a2 + f2 * a + x;
}

inline number spline6interp(number a, number y0, number y1, number y2, number y3, number y4, number y5) {
    number ym2py2 = y0 + y4;
    number ym1py1 = y1 + y3;
    number y2mym2 = y4 - y0;
    number y1mym1 = y3 - y1;
    number sixthym1py1 = (number)1 / (number)6.0 * ym1py1;
    number c0 = (number)1 / (number)120.0 * ym2py2 + (number)13 / (number)60.0 * ym1py1 + (number)11 / (number)20.0 * y2;
    number c1 = (number)1 / (number)24.0 * y2mym2 + (number)5 / (number)12.0 * y1mym1;
    number c2 = (number)1 / (number)12.0 * ym2py2 + sixthym1py1 - (number)1 / (number)2.0 * y2;
    number c3 = (number)1 / (number)12.0 * y2mym2 - (number)1 / (number)6.0 * y1mym1;
    number c4 = (number)1 / (number)24.0 * ym2py2 - sixthym1py1 + (number)1 / (number)4.0 * y2;
    number c5 = (number)1 / (number)120.0 * (y5 - y0) + (number)1 / (number)24.0 * (y1 - y4) + (number)1 / (number)12.0 * (y3 - y2);
    return ((((c5 * a + c4) * a + c3) * a + c2) * a + c1) * a + c0;
}

inline number cosT8(number r) {
    number t84 = 56.0;
    number t83 = 1680.0;
    number t82 = 20160.0;
    number t81 = 2.4801587302e-05;
    number t73 = 42.0;
    number t72 = 840.0;
    number t71 = 1.9841269841e-04;

    if (r < 0.785398163397448309615660845819875721 && r > -0.785398163397448309615660845819875721) {
        number rr = r * r;
        return 1.0 - rr * t81 * (t82 - rr * (t83 - rr * (t84 - rr)));
    } else if (r > 0.0) {
        r -= 1.57079632679489661923132169163975144;
        number rr = r * r;
        return -r * (1.0 - t71 * rr * (t72 - rr * (t73 - rr)));
    } else {
        r += 1.57079632679489661923132169163975144;
        number rr = r * r;
        return r * (1.0 - t71 * rr * (t72 - rr * (t73 - rr)));
    }
}

inline number cosineinterp(number frac, number x, number y) {
    number a2 = (1.0 - this->cosT8(frac * 3.14159265358979323846)) / (number)2.0;
    return x * (1.0 - a2) + y * a2;
}

number maximum(number x, number y) {
    return (x < y ? y : x);
}

number wrap(number x, number low, number high) {
    number lo;
    number hi;

    if (low == high)
        return low;

    if (low > high) {
        hi = low;
        lo = high;
    } else {
        lo = low;
        hi = high;
    }

    number range = hi - lo;

    if (x >= lo && x < hi)
        return x;

    if (range <= 0.000000001)
        return lo;

    Int numWraps = (Int)(trunc((x - lo) / range));
    numWraps = numWraps - ((x < lo ? 1 : 0));
    number result = x - range * numWraps;

    if (result >= hi)
        return result - range;
    else
        return result;
}

inline number safediv(number num, number denom) {
    return (denom == 0.0 ? 0.0 : num / denom);
}

number safepow(number base, number exponent) {
    return fixnan(rnbo_pow(base, exponent));
}

number scale(
    number x,
    number lowin,
    number hiin,
    number lowout,
    number highout,
    number pow
) {
    auto inscale = this->safediv(1., hiin - lowin);
    number outdiff = highout - lowout;
    number value = (x - lowin) * inscale;

    if (pow != 1) {
        if (value > 0)
            value = this->safepow(value, pow);
        else
            value = -this->safepow(-value, pow);
    }

    value = value * outdiff + lowout;
    return value;
}

inline number intnum(const number value) {
    return trunc(value);
}

MillisecondTime sampstoms(number samps) {
    return samps * 1000 / this->sr;
}

void param_01_value_set(number v) {
    v = this->param_01_value_constrain(v);
    this->param_01_value = v;
    this->sendParameter(0, false);

    if (this->param_01_value != this->param_01_lastValue) {
        this->getEngine()->presetTouched();
        this->param_01_lastValue = this->param_01_value;
    }

    {
        listbase<number, 1> converted = {v};
        this->linetilde_02_segments_set(converted);
    }

    this->expr_02_in1_set(v);
}

void param_02_value_set(number v) {
    v = this->param_02_value_constrain(v);
    this->param_02_value = v;
    this->sendParameter(1, false);

    if (this->param_02_value != this->param_02_lastValue) {
        this->getEngine()->presetTouched();
        this->param_02_lastValue = this->param_02_value;
    }

    this->gen_01_sample_rate_reduction_set(v);
}

void param_03_value_set(number v) {
    v = this->param_03_value_constrain(v);
    this->param_03_value = v;
    this->sendParameter(2, false);

    if (this->param_03_value != this->param_03_lastValue) {
        this->getEngine()->presetTouched();
        this->param_03_lastValue = this->param_03_value;
    }

    this->gen_01_decay_set(v);
}

MillisecondTime getPatcherTime() const {
    return this->_currentTime;
}

void linetilde_01_target_bang() {}

void linetilde_02_target_bang() {}

void deallocateSignals() {
    Index i;

    for (i = 0; i < 6; i++) {
        this->signals[i] = freeSignal(this->signals[i]);
    }

    this->globaltransport_tempo = freeSignal(this->globaltransport_tempo);
    this->globaltransport_state = freeSignal(this->globaltransport_state);
    this->zeroBuffer = freeSignal(this->zeroBuffer);
    this->dummyBuffer = freeSignal(this->dummyBuffer);
}

Index getMaxBlockSize() const {
    return this->maxvs;
}

number getSampleRate() const {
    return this->sr;
}

bool hasFixedVectorSize() const {
    return false;
}

void setProbingTarget(MessageTag ) {}

void fillRNBODefaultSinus(DataRef& ref) {
    SampleBuffer buffer(ref);
    number bufsize = buffer->getSize();

    for (Index i = 0; i < bufsize; i++) {
        buffer[i] = rnbo_cos(i * 3.14159265358979323846 * 2. / bufsize);
    }
}

void fillDataRef(DataRefIndex index, DataRef& ref) {
    switch (index) {
    case 28:
        {
        this->fillRNBODefaultSinus(ref);
        break;
        }
    }
}

void zeroDataRef(DataRef& ref) {
    ref->setZero();
}

void allocateDataRefs() {
    this->gen_01_cycle_233_buffer->requestSize(16384, 1);
    this->gen_01_cycle_233_buffer->setSampleRate(this->sr);
    this->gen_01_cycle_241_buffer->requestSize(16384, 1);
    this->gen_01_cycle_241_buffer->setSampleRate(this->sr);
    this->gen_01_cycle_249_buffer->requestSize(16384, 1);
    this->gen_01_cycle_249_buffer->setSampleRate(this->sr);
    this->gen_01_cycle_257_buffer->requestSize(16384, 1);
    this->gen_01_cycle_257_buffer->setSampleRate(this->sr);
    this->gen_01_delay_1_buffer = this->gen_01_delay_1_buffer->allocateIfNeeded();

    if (this->gen_01_delay_1_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_1_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_1_bufferobj);

        this->getEngine()->sendDataRefUpdated(0);
    }

    this->gen_01_delay_2_buffer = this->gen_01_delay_2_buffer->allocateIfNeeded();

    if (this->gen_01_delay_2_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_2_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_2_bufferobj);

        this->getEngine()->sendDataRefUpdated(1);
    }

    this->gen_01_delay_3_buffer = this->gen_01_delay_3_buffer->allocateIfNeeded();

    if (this->gen_01_delay_3_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_3_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_3_bufferobj);

        this->getEngine()->sendDataRefUpdated(2);
    }

    this->gen_01_delay_4_buffer = this->gen_01_delay_4_buffer->allocateIfNeeded();

    if (this->gen_01_delay_4_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_4_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_4_bufferobj);

        this->getEngine()->sendDataRefUpdated(3);
    }

    this->gen_01_delay_5_buffer = this->gen_01_delay_5_buffer->allocateIfNeeded();

    if (this->gen_01_delay_5_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_5_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_5_bufferobj);

        this->getEngine()->sendDataRefUpdated(4);
    }

    this->gen_01_delay_6_buffer = this->gen_01_delay_6_buffer->allocateIfNeeded();

    if (this->gen_01_delay_6_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_6_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_6_bufferobj);

        this->getEngine()->sendDataRefUpdated(5);
    }

    this->gen_01_delay_7_buffer = this->gen_01_delay_7_buffer->allocateIfNeeded();

    if (this->gen_01_delay_7_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_7_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_7_bufferobj);

        this->getEngine()->sendDataRefUpdated(6);
    }

    this->gen_01_delay_8_buffer = this->gen_01_delay_8_buffer->allocateIfNeeded();

    if (this->gen_01_delay_8_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_8_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_8_bufferobj);

        this->getEngine()->sendDataRefUpdated(7);
    }

    this->gen_01_delay_9_buffer = this->gen_01_delay_9_buffer->allocateIfNeeded();

    if (this->gen_01_delay_9_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_9_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_9_bufferobj);

        this->getEngine()->sendDataRefUpdated(8);
    }

    this->gen_01_delay_10_buffer = this->gen_01_delay_10_buffer->allocateIfNeeded();

    if (this->gen_01_delay_10_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_10_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_10_bufferobj);

        this->getEngine()->sendDataRefUpdated(9);
    }

    this->gen_01_delay_11_buffer = this->gen_01_delay_11_buffer->allocateIfNeeded();

    if (this->gen_01_delay_11_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_11_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_11_bufferobj);

        this->getEngine()->sendDataRefUpdated(10);
    }

    this->gen_01_delay_12_buffer = this->gen_01_delay_12_buffer->allocateIfNeeded();

    if (this->gen_01_delay_12_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_12_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_12_bufferobj);

        this->getEngine()->sendDataRefUpdated(11);
    }

    this->gen_01_delay_13_buffer = this->gen_01_delay_13_buffer->allocateIfNeeded();

    if (this->gen_01_delay_13_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_13_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_13_bufferobj);

        this->getEngine()->sendDataRefUpdated(12);
    }

    this->gen_01_delay_14_buffer = this->gen_01_delay_14_buffer->allocateIfNeeded();

    if (this->gen_01_delay_14_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_14_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_14_bufferobj);

        this->getEngine()->sendDataRefUpdated(13);
    }

    this->gen_01_delay_15_buffer = this->gen_01_delay_15_buffer->allocateIfNeeded();

    if (this->gen_01_delay_15_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_15_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_15_bufferobj);

        this->getEngine()->sendDataRefUpdated(14);
    }

    this->gen_01_delay_16_buffer = this->gen_01_delay_16_buffer->allocateIfNeeded();

    if (this->gen_01_delay_16_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_16_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_16_bufferobj);

        this->getEngine()->sendDataRefUpdated(15);
    }

    this->gen_01_delay_17_buffer = this->gen_01_delay_17_buffer->allocateIfNeeded();

    if (this->gen_01_delay_17_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_17_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_17_bufferobj);

        this->getEngine()->sendDataRefUpdated(16);
    }

    this->gen_01_delay_18_buffer = this->gen_01_delay_18_buffer->allocateIfNeeded();

    if (this->gen_01_delay_18_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_18_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_18_bufferobj);

        this->getEngine()->sendDataRefUpdated(17);
    }

    this->gen_01_delay_19_buffer = this->gen_01_delay_19_buffer->allocateIfNeeded();

    if (this->gen_01_delay_19_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_19_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_19_bufferobj);

        this->getEngine()->sendDataRefUpdated(18);
    }

    this->gen_01_delay_20_buffer = this->gen_01_delay_20_buffer->allocateIfNeeded();

    if (this->gen_01_delay_20_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_20_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_20_bufferobj);

        this->getEngine()->sendDataRefUpdated(19);
    }

    this->gen_01_delay_21_buffer = this->gen_01_delay_21_buffer->allocateIfNeeded();

    if (this->gen_01_delay_21_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_21_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_21_bufferobj);

        this->getEngine()->sendDataRefUpdated(20);
    }

    this->gen_01_delay_22_buffer = this->gen_01_delay_22_buffer->allocateIfNeeded();

    if (this->gen_01_delay_22_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_22_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_22_bufferobj);

        this->getEngine()->sendDataRefUpdated(21);
    }

    this->gen_01_delay_23_buffer = this->gen_01_delay_23_buffer->allocateIfNeeded();

    if (this->gen_01_delay_23_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_23_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_23_bufferobj);

        this->getEngine()->sendDataRefUpdated(22);
    }

    this->gen_01_delay_24_buffer = this->gen_01_delay_24_buffer->allocateIfNeeded();

    if (this->gen_01_delay_24_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_24_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_24_bufferobj);

        this->getEngine()->sendDataRefUpdated(23);
    }

    this->gen_01_delay_25_buffer = this->gen_01_delay_25_buffer->allocateIfNeeded();

    if (this->gen_01_delay_25_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_25_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_25_bufferobj);

        this->getEngine()->sendDataRefUpdated(24);
    }

    this->gen_01_delay_26_buffer = this->gen_01_delay_26_buffer->allocateIfNeeded();

    if (this->gen_01_delay_26_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_26_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_26_bufferobj);

        this->getEngine()->sendDataRefUpdated(25);
    }

    this->gen_01_delay_27_buffer = this->gen_01_delay_27_buffer->allocateIfNeeded();

    if (this->gen_01_delay_27_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_27_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_27_bufferobj);

        this->getEngine()->sendDataRefUpdated(26);
    }

    this->gen_01_delay_28_buffer = this->gen_01_delay_28_buffer->allocateIfNeeded();

    if (this->gen_01_delay_28_bufferobj->hasRequestedSize()) {
        if (this->gen_01_delay_28_bufferobj->wantsFill())
            this->zeroDataRef(this->gen_01_delay_28_bufferobj);

        this->getEngine()->sendDataRefUpdated(27);
    }

    this->gen_01_cycle_233_buffer = this->gen_01_cycle_233_buffer->allocateIfNeeded();
    this->gen_01_cycle_241_buffer = this->gen_01_cycle_241_buffer->allocateIfNeeded();
    this->gen_01_cycle_249_buffer = this->gen_01_cycle_249_buffer->allocateIfNeeded();
    this->gen_01_cycle_257_buffer = this->gen_01_cycle_257_buffer->allocateIfNeeded();

    if (this->RNBODefaultSinus->hasRequestedSize()) {
        if (this->RNBODefaultSinus->wantsFill())
            this->fillRNBODefaultSinus(this->RNBODefaultSinus);

        this->getEngine()->sendDataRefUpdated(28);
    }
}

void initializeObjects() {
    this->gen_01_delay_1_init();
    this->gen_01_delay_2_init();
    this->gen_01_delay_3_init();
    this->gen_01_delay_4_init();
    this->gen_01_delay_5_init();
    this->gen_01_delay_6_init();
    this->gen_01_delay_7_init();
    this->gen_01_delay_8_init();
    this->gen_01_delay_9_init();
    this->gen_01_delay_10_init();
    this->gen_01_delay_11_init();
    this->gen_01_delay_12_init();
    this->gen_01_delay_13_init();
    this->gen_01_delay_14_init();
    this->gen_01_delay_15_init();
    this->gen_01_delay_16_init();
    this->gen_01_delay_17_init();
    this->gen_01_delay_18_init();
    this->gen_01_delay_19_init();
    this->gen_01_delay_20_init();
    this->gen_01_delay_21_init();
    this->gen_01_delay_22_init();
    this->gen_01_delay_23_init();
    this->gen_01_delay_24_init();
    this->gen_01_delay_25_init();
    this->gen_01_delay_26_init();
    this->gen_01_delay_27_init();
    this->gen_01_delay_28_init();
    this->gen_01_history_29_init();
    this->gen_01_history_30_init();
    this->gen_01_history_31_init();
    this->gen_01_history_32_init();
    this->gen_01_history_33_init();
    this->gen_01_history_34_init();
    this->gen_01_history_35_init();
    this->gen_01_history_36_init();
    this->gen_01_counter_17_init();
    this->gen_01_latch_20_init();
    this->gen_01_latch_25_init();
    this->gen_01_latch_369_init();
    this->gen_01_latch_400_init();
}

Index getIsMuted()  {
    return this->isMuted;
}

void setIsMuted(Index v)  {
    this->isMuted = v;
}

void onSampleRateChanged(double ) {}

void extractState(PatcherStateInterface& ) {}

void applyState() {}

void processClockEvent(MillisecondTime time, ClockId index, bool hasValue, ParameterValue value) {
    RNBO_UNUSED(value);
    RNBO_UNUSED(hasValue);
    this->updateTime(time, (ENGINE*)nullptr);

    switch (index) {
    case -281953904:
        {
        this->linetilde_01_target_bang();
        break;
        }
    case -1841075377:
        {
        this->linetilde_02_target_bang();
        break;
        }
    }
}

void processOutletAtCurrentTime(EngineLink* , OutletIndex , ParameterValue ) {}

void processOutletEvent(
    EngineLink* sender,
    OutletIndex index,
    ParameterValue value,
    MillisecondTime time
) {
    this->updateTime(time, (ENGINE*)nullptr);
    this->processOutletAtCurrentTime(sender, index, value);
}

void sendOutlet(OutletIndex index, ParameterValue value) {
    this->getEngine()->sendOutlet(this, index, value);
}

void startup() {
    this->updateTime(this->getEngine()->getCurrentTime(), (ENGINE*)nullptr);

    {
        this->scheduleParamInit(0, 0);
    }

    {
        this->scheduleParamInit(1, 0);
    }

    {
        this->scheduleParamInit(2, 0);
    }

    this->processParamInitEvents();
}

number param_01_value_constrain(number v) const {
    v = (v > 1 ? 1 : (v < 0 ? 0 : v));
    return v;
}

void linetilde_02_time_set(number v) {
    this->linetilde_02_time = v;
}

template<typename LISTTYPE> void linetilde_02_segments_set(const LISTTYPE& v) {
    this->linetilde_02_segments = jsCreateListCopy(v);

    if ((bool)(v->length)) {
        if (v->length == 1 && this->linetilde_02_time == 0) {
            this->linetilde_02_activeRamps->length = 0;
            this->linetilde_02_currentValue = v[0];
        } else {
            auto currentTime = this->currentsampletime();
            number lastRampValue = this->linetilde_02_currentValue;
            number rampEnd = currentTime - this->sampleOffsetIntoNextAudioBuffer;

            for (Index i = 0; i < this->linetilde_02_activeRamps->length; i += 3) {
                rampEnd = this->linetilde_02_activeRamps[(Index)(i + 2)];

                if (rampEnd > currentTime) {
                    this->linetilde_02_activeRamps[(Index)(i + 2)] = currentTime;
                    number diff = rampEnd - currentTime;
                    number valueDiff = diff * this->linetilde_02_activeRamps[(Index)(i + 1)];
                    lastRampValue = this->linetilde_02_activeRamps[(Index)i] - valueDiff;
                    this->linetilde_02_activeRamps[(Index)i] = lastRampValue;
                    this->linetilde_02_activeRamps->length = i + 3;
                    rampEnd = currentTime;
                } else {
                    lastRampValue = this->linetilde_02_activeRamps[(Index)i];
                }
            }

            if (rampEnd < currentTime) {
                this->linetilde_02_activeRamps->push(lastRampValue);
                this->linetilde_02_activeRamps->push(0);
                this->linetilde_02_activeRamps->push(currentTime);
            }

            number lastRampEnd = currentTime;

            for (Index i = 0; i < v->length; i += 2) {
                number destinationValue = v[(Index)i];
                number inc = 0;
                number rampTimeInSamples;

                if (v->length > i + 1) {
                    rampTimeInSamples = this->mstosamps(v[(Index)(i + 1)]);

                    if ((bool)(this->linetilde_02_keepramp)) {
                        this->linetilde_02_time_set(v[(Index)(i + 1)]);
                    }
                } else {
                    rampTimeInSamples = this->mstosamps(this->linetilde_02_time);
                }

                if (rampTimeInSamples <= 0) {
                    rampTimeInSamples = 1;
                }

                inc = (destinationValue - lastRampValue) / rampTimeInSamples;
                lastRampEnd += rampTimeInSamples;
                this->linetilde_02_activeRamps->push(destinationValue);
                this->linetilde_02_activeRamps->push(inc);
                this->linetilde_02_activeRamps->push(lastRampEnd);
                lastRampValue = destinationValue;
            }
        }
    }
}

void linetilde_01_time_set(number v) {
    this->linetilde_01_time = v;
}

template<typename LISTTYPE> void linetilde_01_segments_set(const LISTTYPE& v) {
    this->linetilde_01_segments = jsCreateListCopy(v);

    if ((bool)(v->length)) {
        if (v->length == 1 && this->linetilde_01_time == 0) {
            this->linetilde_01_activeRamps->length = 0;
            this->linetilde_01_currentValue = v[0];
        } else {
            auto currentTime = this->currentsampletime();
            number lastRampValue = this->linetilde_01_currentValue;
            number rampEnd = currentTime - this->sampleOffsetIntoNextAudioBuffer;

            for (Index i = 0; i < this->linetilde_01_activeRamps->length; i += 3) {
                rampEnd = this->linetilde_01_activeRamps[(Index)(i + 2)];

                if (rampEnd > currentTime) {
                    this->linetilde_01_activeRamps[(Index)(i + 2)] = currentTime;
                    number diff = rampEnd - currentTime;
                    number valueDiff = diff * this->linetilde_01_activeRamps[(Index)(i + 1)];
                    lastRampValue = this->linetilde_01_activeRamps[(Index)i] - valueDiff;
                    this->linetilde_01_activeRamps[(Index)i] = lastRampValue;
                    this->linetilde_01_activeRamps->length = i + 3;
                    rampEnd = currentTime;
                } else {
                    lastRampValue = this->linetilde_01_activeRamps[(Index)i];
                }
            }

            if (rampEnd < currentTime) {
                this->linetilde_01_activeRamps->push(lastRampValue);
                this->linetilde_01_activeRamps->push(0);
                this->linetilde_01_activeRamps->push(currentTime);
            }

            number lastRampEnd = currentTime;

            for (Index i = 0; i < v->length; i += 2) {
                number destinationValue = v[(Index)i];
                number inc = 0;
                number rampTimeInSamples;

                if (v->length > i + 1) {
                    rampTimeInSamples = this->mstosamps(v[(Index)(i + 1)]);

                    if ((bool)(this->linetilde_01_keepramp)) {
                        this->linetilde_01_time_set(v[(Index)(i + 1)]);
                    }
                } else {
                    rampTimeInSamples = this->mstosamps(this->linetilde_01_time);
                }

                if (rampTimeInSamples <= 0) {
                    rampTimeInSamples = 1;
                }

                inc = (destinationValue - lastRampValue) / rampTimeInSamples;
                lastRampEnd += rampTimeInSamples;
                this->linetilde_01_activeRamps->push(destinationValue);
                this->linetilde_01_activeRamps->push(inc);
                this->linetilde_01_activeRamps->push(lastRampEnd);
                lastRampValue = destinationValue;
            }
        }
    }
}

void expr_01_out1_set(number v) {
    this->expr_01_out1 = v;

    {
        listbase<number, 1> converted = {this->expr_01_out1};
        this->linetilde_01_segments_set(converted);
    }
}

void expr_01_in1_set(number in1) {
    this->expr_01_in1 = in1;
    this->expr_01_out1_set(this->expr_01_in1 + this->expr_01_in2);//#map:+_obj-16:1
}

void expr_02_out1_set(number v) {
    this->expr_02_out1 = v;
    this->expr_01_in1_set(this->expr_02_out1);
}

void expr_02_in1_set(number in1) {
    this->expr_02_in1 = in1;
    this->expr_02_out1_set(this->expr_02_in1 * this->expr_02_in2);//#map:*_obj-15:1
}

number param_02_value_constrain(number v) const {
    v = (v > 1 ? 1 : (v < 0 ? 0 : v));
    return v;
}

number gen_01_sample_rate_reduction_constrain(number v) const {
    if (v < 0)
        v = 0;

    if (v > 1)
        v = 1;

    return v;
}

void gen_01_sample_rate_reduction_set(number v) {
    v = this->gen_01_sample_rate_reduction_constrain(v);
    this->gen_01_sample_rate_reduction = v;
}

number param_03_value_constrain(number v) const {
    v = (v > 1 ? 1 : (v < 0 ? 0 : v));
    return v;
}

number gen_01_decay_constrain(number v) const {
    if (v < 0)
        v = 0;

    if (v > 0.95)
        v = 0.95;

    return v;
}

void gen_01_decay_set(number v) {
    v = this->gen_01_decay_constrain(v);
    this->gen_01_decay = v;
}

void linetilde_01_perform(SampleValue * out, Index n) {
    auto __linetilde_01_time = this->linetilde_01_time;
    auto __linetilde_01_keepramp = this->linetilde_01_keepramp;
    auto __linetilde_01_currentValue = this->linetilde_01_currentValue;
    Index i = 0;

    if ((bool)(this->linetilde_01_activeRamps->length)) {
        while ((bool)(this->linetilde_01_activeRamps->length) && i < n) {
            number destinationValue = this->linetilde_01_activeRamps[0];
            number inc = this->linetilde_01_activeRamps[1];
            number rampTimeInSamples = this->linetilde_01_activeRamps[2] - this->audioProcessSampleCount - i;
            number val = __linetilde_01_currentValue;

            while (rampTimeInSamples > 0 && i < n) {
                out[(Index)i] = val;
                val += inc;
                i++;
                rampTimeInSamples--;
            }

            if (rampTimeInSamples <= 0) {
                val = destinationValue;
                this->linetilde_01_activeRamps->splice(0, 3);

                if ((bool)(!(bool)(this->linetilde_01_activeRamps->length))) {
                    this->getEngine()->scheduleClockEventWithValue(
                        this,
                        -281953904,
                        this->sampsToMs((SampleIndex)(this->vs)) + this->_currentTime,
                        0
                    );;

                    if ((bool)(!(bool)(__linetilde_01_keepramp))) {
                        __linetilde_01_time = 0;
                    }
                }
            }

            __linetilde_01_currentValue = val;
        }
    }

    while (i < n) {
        out[(Index)i] = __linetilde_01_currentValue;
        i++;
    }

    this->linetilde_01_currentValue = __linetilde_01_currentValue;
    this->linetilde_01_time = __linetilde_01_time;
}

void signalsend_01_perform(const SampleValue * input, SampleValue * send, Index n) {
    for (Index i = 0; i < n; i++) {
        send[(Index)i] = input[(Index)i];
    }
}

void signalreceive_02_perform(const SampleValue * receive, SampleValue * output, Index n) {
    for (Index i = 0; i < n; i++) {
        output[(Index)i] = receive[(Index)i];
    }
}

void linetilde_02_perform(SampleValue * out, Index n) {
    auto __linetilde_02_time = this->linetilde_02_time;
    auto __linetilde_02_keepramp = this->linetilde_02_keepramp;
    auto __linetilde_02_currentValue = this->linetilde_02_currentValue;
    Index i = 0;

    if ((bool)(this->linetilde_02_activeRamps->length)) {
        while ((bool)(this->linetilde_02_activeRamps->length) && i < n) {
            number destinationValue = this->linetilde_02_activeRamps[0];
            number inc = this->linetilde_02_activeRamps[1];
            number rampTimeInSamples = this->linetilde_02_activeRamps[2] - this->audioProcessSampleCount - i;
            number val = __linetilde_02_currentValue;

            while (rampTimeInSamples > 0 && i < n) {
                out[(Index)i] = val;
                val += inc;
                i++;
                rampTimeInSamples--;
            }

            if (rampTimeInSamples <= 0) {
                val = destinationValue;
                this->linetilde_02_activeRamps->splice(0, 3);

                if ((bool)(!(bool)(this->linetilde_02_activeRamps->length))) {
                    this->getEngine()->scheduleClockEventWithValue(
                        this,
                        -1841075377,
                        this->sampsToMs((SampleIndex)(this->vs)) + this->_currentTime,
                        0
                    );;

                    if ((bool)(!(bool)(__linetilde_02_keepramp))) {
                        __linetilde_02_time = 0;
                    }
                }
            }

            __linetilde_02_currentValue = val;
        }
    }

    while (i < n) {
        out[(Index)i] = __linetilde_02_currentValue;
        i++;
    }

    this->linetilde_02_currentValue = __linetilde_02_currentValue;
    this->linetilde_02_time = __linetilde_02_time;
}

void signalsend_02_perform(const SampleValue * input, SampleValue * send, Index n) {
    for (Index i = 0; i < n; i++) {
        send[(Index)i] = input[(Index)i];
    }
}

void signalreceive_01_perform(const SampleValue * receive, SampleValue * output, Index n) {
    for (Index i = 0; i < n; i++) {
        output[(Index)i] = receive[(Index)i];
    }
}

void dspexpr_03_perform(const Sample * in1, const Sample * in2, SampleValue * out1, Index n) {
    Index i;

    for (i = 0; i < (Index)n; i++) {
        out1[(Index)i] = in1[(Index)i] * in2[(Index)i];//#map:_###_obj_###_:1
    }
}

void gen_01_perform(
    const Sample * in1,
    const Sample * in2,
    number decay,
    number sample_rate_reduction,
    SampleValue * out1,
    SampleValue * out2,
    Index n
) {
    auto __gen_01_history_36_value = this->gen_01_history_36_value;
    auto __gen_01_history_35_value = this->gen_01_history_35_value;
    auto __gen_01_history_34_value = this->gen_01_history_34_value;
    auto __gen_01_history_33_value = this->gen_01_history_33_value;
    auto __gen_01_history_32_value = this->gen_01_history_32_value;
    auto __gen_01_history_31_value = this->gen_01_history_31_value;
    auto __gen_01_history_30_value = this->gen_01_history_30_value;
    auto __gen_01_history_29_value = this->gen_01_history_29_value;
    number sample_rate_reduction_37_0 = sample_rate_reduction;
    auto scale_38_1 = this->scale(sample_rate_reduction_37_0, 0, 1, 0.75, 0, 1);
    number damping_39_2 = scale_38_1;
    number damping_40_3 = damping_39_2;
    number damping_41_4 = damping_39_2;
    number damping_42_5 = damping_39_2;
    number bandwidth_43_6 = scale_38_1;
    number bandwidth_44_7 = bandwidth_43_6;
    number sample_rate_reduction_45_8 = sample_rate_reduction_37_0;
    auto int_122_86 = this->intnum(1);
    number decay_177_141 = decay;
    number decay_178_142 = decay_177_141;
    number decay_180_144 = decay_177_141;
    number decay_240_204 = decay_177_141;
    auto int_241_205 = this->intnum(1);
    number decay_250_214 = decay_177_141;
    number decay_258_222 = decay_177_141;
    number decay_338_302 = decay_177_141;
    number decay_357_321 = decay_177_141;
    Index i;

    for (i = 0; i < (Index)n; i++) {
        number float_46_9 = float(3);
        auto scale_47_10 = this->scale(sample_rate_reduction_45_8, 0, 1, 500, this->sr, float_46_9);
        number div_48_11 = (scale_47_10 == 0. ? 0. : this->sr / scale_47_10);
        number input_reduction_49_12 = div_48_11;
        number mix_50_13 = input_reduction_49_12 + 0.9995 * (__gen_01_history_29_value - input_reduction_49_12);
        number input_reduction_51_14 = input_reduction_49_12;
        number mix_52_15 = input_reduction_51_14 + 0.9995 * (__gen_01_history_30_value - input_reduction_51_14);
        number float_53_16 = float(1);
        number counter_54 = 0;
        number counter_55 = 0;
        number counter_56 = 0;
        array<number, 3> result_18 = this->gen_01_counter_17_next(float_53_16, 0, div_48_11);
        counter_56 = result_18[2];
        counter_55 = result_18[1];
        counter_54 = result_18[0];
        number triggerlatch_57_19 = counter_55;
        number latch_58_21 = this->gen_01_latch_20_next(in2[(Index)i], triggerlatch_57_19);
        number triggerlatch_59_22 = triggerlatch_57_19;
        number triggerlatch_60_23 = triggerlatch_57_19;
        number triggerlatch_61_24 = triggerlatch_57_19;
        number latch_62_26 = this->gen_01_latch_25_next(in1[(Index)i], triggerlatch_61_24);
        number float_63_27 = float(0.85);
        number decay_diffusion_64_28 = float_63_27;
        number decay_diffusion_65_29 = decay_diffusion_64_28;
        number decay_diffusion_66_30 = decay_diffusion_64_28;
        number decay_diffusion_67_31 = decay_diffusion_64_28;
        number float_68_32 = float(2);
        number mul_69_33 = float_68_32 * mix_50_13;
        auto mstosamps_70_34 = this->mstosamps(mul_69_33);
        number predelay_71_35 = mstosamps_70_34;
        number tap_72_36 = this->gen_01_delay_1_read(predelay_71_35, 0);
        number mix_73_37 = tap_72_36 + bandwidth_43_6 * (__gen_01_history_31_value - tap_72_36);
        number predelay_74_38 = predelay_71_35;
        number tap_75_39 = this->gen_01_delay_2_read(predelay_74_38, 0);
        number mix_76_40 = tap_75_39 + bandwidth_44_7 * (__gen_01_history_32_value - tap_75_39);
        number mul_77_41 = this->sr * mix_52_15;
        number sample_rate_78_42 = mul_77_41;
        number sample_rate_79_43 = sample_rate_78_42;
        number mul_80_44 = sample_rate_79_43 * 0.141695;
        number trunc_81_45 = trunc(mul_80_44);
        number tap_82_46 = this->gen_01_delay_3_read(trunc_81_45, 0);
        number mix_83_47 = tap_82_46 + damping_40_3 * (__gen_01_history_33_value - tap_82_46);
        number sample_rate_84_48 = sample_rate_78_42;
        number mul_85_49 = sample_rate_84_48 * 0.149625;
        number trunc_86_50 = trunc(mul_85_49);
        number tap_87_51 = this->gen_01_delay_4_read(trunc_86_50, 0);
        number mix_88_52 = tap_87_51 + damping_39_2 * (__gen_01_history_34_value - tap_87_51);
        number sample_rate_89_53 = sample_rate_78_42;
        number mul_90_54 = sample_rate_89_53 * 0.149625;
        number trunc_91_55 = trunc(mul_90_54);
        number tap_92_56 = this->gen_01_delay_5_read(trunc_91_55, 0);
        number mix_93_57 = tap_92_56 + damping_41_4 * (__gen_01_history_35_value - tap_92_56);
        number sample_rate_94_58 = sample_rate_78_42;
        number mul_95_59 = sample_rate_94_58 * 0.141695;
        number trunc_96_60 = trunc(mul_95_59);
        number tap_97_61 = this->gen_01_delay_6_read(trunc_96_60, 0);
        number mix_98_62 = tap_97_61 + damping_42_5 * (__gen_01_history_36_value - tap_97_61);
        number tap4R_99_63 = tap_97_61;
        number mul_100_64 = tap4R_99_63 * 0.6;
        number mul_101_65 = sample_rate_78_42 * 0.022579;
        number trunc_102_66 = trunc(mul_101_65);
        number tap4L_103_67 = tap_87_51;
        number mul_104_68 = tap4L_103_67 * 0.6;
        number sample_rate_105_69 = sample_rate_78_42;
        number mul_106_70 = sample_rate_105_69 * 0.0005;
        number sample_rate_107_71 = sample_rate_78_42;
        number mul_108_72 = sample_rate_107_71 * 0.030509;
        number trunc_109_73 = trunc(mul_108_72);
        number sample_rate_110_74 = sample_rate_78_42;
        number mul_111_75 = sample_rate_110_74 * 0.0005;
        number sample_rate_112_76 = sample_rate_78_42;
        number mul_113_77 = sample_rate_112_76 * 0.022579;
        number trunc_114_78 = trunc(mul_113_77);
        number sample_rate_115_79 = sample_rate_78_42;
        number mul_116_80 = sample_rate_115_79 * 0.0005;
        number sample_rate_117_81 = sample_rate_78_42;
        number mul_118_82 = sample_rate_117_81 * 0.0005;
        number sample_rate_119_83 = sample_rate_78_42;
        number mul_120_84 = sample_rate_119_83 * 0.030509;
        number trunc_121_85 = trunc(mul_120_84);
        number sample_rate_123_87 = sample_rate_78_42;
        number mul_124_88 = sample_rate_123_87 * 0.0043;
        number trunc_125_89 = trunc(mul_124_88);
        number mul_126_90 = sample_rate_123_87 * 0.0215;
        number trunc_127_91 = trunc(mul_126_90);
        number mul_128_92 = sample_rate_123_87 * 0.0268;
        number trunc_129_93 = trunc(mul_128_92);
        number mul_130_94 = sample_rate_123_87 * 0.0298;
        number trunc_131_95 = trunc(mul_130_94);
        number mul_132_96 = sample_rate_123_87 * 0.0458;
        number trunc_133_97 = trunc(mul_132_96);
        number mul_134_98 = sample_rate_123_87 * 0.0485;
        number trunc_135_99 = trunc(mul_134_98);
        number mul_136_100 = sample_rate_123_87 * 0.0572;
        number trunc_137_101 = trunc(mul_136_100);
        number mul_138_102 = sample_rate_123_87 * 0.0595;
        number trunc_139_103 = trunc(mul_138_102);
        number mul_140_104 = sample_rate_123_87 * 0.0726;
        number trunc_141_105 = trunc(mul_140_104);
        number mul_142_106 = sample_rate_123_87 * 0.0753;
        number trunc_143_107 = trunc(mul_142_106);
        number tap_144_108 = this->gen_01_delay_7_read(trunc_125_89, 0);
        number tap_145_109 = this->gen_01_delay_7_read(trunc_127_91, 0);
        number tap_146_110 = this->gen_01_delay_7_read(trunc_129_93, 0);
        number tap_147_111 = this->gen_01_delay_7_read(trunc_131_95, 0);
        number tap_148_112 = this->gen_01_delay_7_read(trunc_133_97, 0);
        number tap_149_113 = this->gen_01_delay_7_read(trunc_135_99, 0);
        number tap_150_114 = this->gen_01_delay_7_read(trunc_137_101, 0);
        number tap_151_115 = this->gen_01_delay_7_read(trunc_139_103, 0);
        number tap_152_116 = this->gen_01_delay_7_read(trunc_141_105, 0);
        number tap_153_117 = this->gen_01_delay_7_read(trunc_143_107, 0);
        number mul_154_118 = tap_144_108 * 0.841;
        number mul_155_119 = tap_145_109 * 0.504;
        number mul_156_120 = tap_146_110 * 0.491;
        number mul_157_121 = tap_147_111 * 0.38;
        number mul_158_122 = tap_148_112 * 0.272;
        number mul_159_123 = tap_149_113 * 0.289;
        number mul_160_124 = tap_150_114 * 0.217;
        number mul_161_125 = tap_151_115 * 0.181;
        number mul_162_126 = tap_152_116 * 0.181;
        number mul_163_127 = tap_153_117 * 0.167;
        number mul_164_128 = (mul_163_127 + mul_162_126 + mul_161_125 + mul_160_124 + mul_159_123 + mul_158_122 + mul_157_121 + mul_156_120 + mul_155_119 + mul_154_118) * 0.7;
        number sample_rate_165_129 = sample_rate_78_42;
        number mul_166_130 = sample_rate_165_129 * 0.009307;
        number trunc_167_131 = trunc(mul_166_130);
        number tap_168_132 = this->gen_01_delay_8_read(trunc_167_131, 0);
        number tap1R_169_133 = tap_92_56;
        number mul_170_134 = tap1R_169_133 * 0.6;
        number sample_rate_171_135 = sample_rate_78_42;
        number mul_172_136 = sample_rate_171_135 * 0.10628;
        number trunc_173_137 = trunc(mul_172_136);
        number tap_174_138 = this->gen_01_delay_9_read(trunc_173_137, 0);
        number tap6R_175_139 = tap_174_138;
        number mul_176_140 = tap6R_175_139 * 0.6;
        number float_179_143 = float(0.9);
        number mul_181_145 = tap_174_138 * decay_180_144;
        number tank2_out_R_182_146 = mul_181_145;
        number float_183_147 = float(0.9);
        number sample_rate_184_148 = sample_rate_78_42;
        number mul_185_149 = sample_rate_184_148 * 0.0043;
        number trunc_186_150 = trunc(mul_185_149);
        number mul_187_151 = sample_rate_184_148 * 0.0215;
        number trunc_188_152 = trunc(mul_187_151);
        number mul_189_153 = sample_rate_184_148 * 0.0225;
        number trunc_190_154 = trunc(mul_189_153);
        number mul_191_155 = sample_rate_184_148 * 0.027;
        number trunc_192_156 = trunc(mul_191_155);
        number mul_193_157 = sample_rate_184_148 * 0.0458;
        number trunc_194_158 = trunc(mul_193_157);
        number mul_195_159 = sample_rate_184_148 * 0.0485;
        number trunc_196_160 = trunc(mul_195_159);
        number mul_197_161 = sample_rate_184_148 * 0.0595;
        number trunc_198_162 = trunc(mul_197_161);
        number mul_199_163 = sample_rate_184_148 * 0.0612;
        number trunc_200_164 = trunc(mul_199_163);
        number mul_201_165 = sample_rate_184_148 * 0.0708;
        number trunc_202_166 = trunc(mul_201_165);
        number mul_203_167 = sample_rate_184_148 * 0.0753;
        number trunc_204_168 = trunc(mul_203_167);
        number tap_205_169 = this->gen_01_delay_10_read(trunc_186_150, 0);
        number tap_206_170 = this->gen_01_delay_10_read(trunc_188_152, 0);
        number tap_207_171 = this->gen_01_delay_10_read(trunc_190_154, 0);
        number tap_208_172 = this->gen_01_delay_10_read(trunc_192_156, 0);
        number tap_209_173 = this->gen_01_delay_10_read(trunc_194_158, 0);
        number tap_210_174 = this->gen_01_delay_10_read(trunc_196_160, 0);
        number tap_211_175 = this->gen_01_delay_10_read(trunc_198_162, 0);
        number tap_212_176 = this->gen_01_delay_10_read(trunc_200_164, 0);
        number tap_213_177 = this->gen_01_delay_10_read(trunc_202_166, 0);
        number tap_214_178 = this->gen_01_delay_10_read(trunc_204_168, 0);
        number mul_215_179 = tap_214_178 * 0.167;
        number mul_216_180 = tap_213_177 * 0.181;
        number mul_217_181 = tap_212_176 * 0.181;
        number mul_218_182 = tap_211_175 * 0.217;
        number mul_219_183 = tap_210_174 * 0.289;
        number mul_220_184 = tap_209_173 * 0.272;
        number mul_221_185 = tap_208_172 * 0.38;
        number mul_222_186 = tap_207_171 * 0.491;
        number mul_223_187 = tap_206_170 * 0.504;
        number mul_224_188 = tap_205_169 * 0.841;
        number mul_225_189 = (mul_224_188 + mul_223_187 + mul_222_186 + mul_221_185 + mul_220_184 + mul_219_183 + mul_218_182 + mul_217_181 + mul_216_180 + mul_215_179) * 0.7;
        number sample_rate_226_190 = sample_rate_78_42;
        number mul_227_191 = sample_rate_226_190 * 0.009307;
        number trunc_228_192 = trunc(mul_227_191);
        number tap_229_193 = this->gen_01_delay_11_read(trunc_228_192, 0);
        number tap1L_230_194 = tap_82_46;
        number mul_231_195 = tap1L_230_194 * 0.6;
        number sample_rate_232_196 = sample_rate_78_42;
        number mul_233_197 = sample_rate_232_196 * 0.124995;
        number trunc_234_198 = trunc(mul_233_197);
        number tap_235_199 = this->gen_01_delay_12_read(trunc_234_198, 0);
        number tap6L_236_200 = tap_235_199;
        number mul_237_201 = tap6L_236_200 * 0.6;
        number mul_238_202 = tap_235_199 * decay_178_142;
        number tank1_out_L_239_203 = mul_238_202;
        number float_242_206 = float(0.85);
        number mul_243_207 = float_242_206 * 0.8333;
        number input_diffusion_244_208 = mul_243_207;
        number input_diffusion_245_209 = input_diffusion_244_208;
        number mul_246_210 = tap_168_132 * input_diffusion_245_209;
        number input_diffusion_247_211 = input_diffusion_244_208;
        number mul_248_212 = tap_229_193 * input_diffusion_247_211;
        number input_diffusion_249_213 = input_diffusion_244_208;
        number mul_251_215 = mix_98_62 * decay_250_214;
        number sample_rate_252_216 = sample_rate_78_42;
        number mul_253_217 = sample_rate_252_216 * 0.089244;
        number trunc_254_218 = trunc(mul_253_217);
        number tap_255_219 = this->gen_01_delay_13_read(trunc_254_218, 0);
        number tap5R_256_220 = tap_255_219;
        number mul_257_221 = tap5R_256_220 * 0.6;
        number mul_259_223 = mix_88_52 * decay_258_222;
        number sample_rate_260_224 = sample_rate_78_42;
        number mul_261_225 = sample_rate_260_224 * 0.060481;
        number trunc_262_226 = trunc(mul_261_225);
        number tap_263_227 = this->gen_01_delay_14_read(trunc_262_226, 0);
        number tap5L_264_228 = tap_263_227;
        number mul_265_229 = tap5L_264_228 * 0.6;
        number div_266_230 = scale_47_10 / (number)44100;
        number lfo_scaler_267_231 = div_266_230;
        number mul_268_232 = int_241_205 * lfo_scaler_267_231;
        number cycle_269 = 0;
        number cycleindex_270 = 0;
        array<number, 2> result_234 = this->gen_01_cycle_233_next(mul_268_232, 0);
        cycleindex_270 = result_234[1];
        cycle_269 = result_234[0];
        number mul_271_235 = cycle_269 * mul_118_82;
        number add_272_236 = mul_271_235 + trunc_121_85;
        number tap_273_237 = this->gen_01_delay_15_read(add_272_236, 0);
        number mul_274_238 = tap_273_237 * decay_diffusion_67_31;
        number lfo_scaler_275_239 = lfo_scaler_267_231;
        number mul_276_240 = int_122_86 * lfo_scaler_275_239;
        number cycle_277 = 0;
        number cycleindex_278 = 0;
        array<number, 2> result_242 = this->gen_01_cycle_241_next(mul_276_240, 0);
        cycleindex_278 = result_242[1];
        cycle_277 = result_242[0];
        number mul_279_243 = cycle_277 * mul_106_70;
        number add_280_244 = mul_279_243 + trunc_109_73;
        number tap_281_245 = this->gen_01_delay_16_read(add_280_244, 0);
        number mul_282_246 = tap_281_245 * decay_diffusion_65_29;
        number lfo_scaler_283_247 = lfo_scaler_267_231;
        number mul_284_248 = float_179_143 * lfo_scaler_283_247;
        number cycle_285 = 0;
        number cycleindex_286 = 0;
        array<number, 2> result_250 = this->gen_01_cycle_249_next(mul_284_248, 0);
        cycleindex_286 = result_250[1];
        cycle_285 = result_250[0];
        number mul_287_251 = cycle_285 * mul_111_75;
        number add_288_252 = mul_287_251 + trunc_114_78;
        number tap_289_253 = this->gen_01_delay_17_read(add_288_252, 0);
        number mul_290_254 = tap_289_253 * decay_diffusion_66_30;
        number lfo_scaler_291_255 = lfo_scaler_267_231;
        number mul_292_256 = float_183_147 * lfo_scaler_291_255;
        number cycle_293 = 0;
        number cycleindex_294 = 0;
        array<number, 2> result_258 = this->gen_01_cycle_257_next(mul_292_256, 0);
        cycleindex_294 = result_258[1];
        cycle_293 = result_258[0];
        number mul_295_259 = cycle_293 * mul_116_80;
        number add_296_260 = mul_295_259 + trunc_102_66;
        number tap_297_261 = this->gen_01_delay_18_read(add_296_260, 0);
        number mul_298_262 = tap_297_261 * decay_diffusion_64_28;
        number mul_299_263 = float_63_27 * 0.7143;
        number decay_diffusion_300_264 = mul_299_263;
        number decay_diffusion_301_265 = decay_diffusion_300_264;
        number mul_302_266 = tap_255_219 * decay_diffusion_301_265;
        number sub_303_267 = mul_251_215 - mul_302_266;
        number mul_304_268 = sub_303_267 * decay_diffusion_301_265;
        number add_305_269 = mul_304_268 + tap_255_219;
        number decay_diffusion_306_270 = decay_diffusion_300_264;
        number mul_307_271 = tap_263_227 * decay_diffusion_306_270;
        number sub_308_272 = mul_259_223 - mul_307_271;
        number mul_309_273 = sub_308_272 * decay_diffusion_306_270;
        number add_310_274 = mul_309_273 + tap_263_227;
        number sample_rate_311_275 = sample_rate_78_42;
        number mul_312_276 = sample_rate_311_275 * 0.012734;
        number trunc_313_277 = trunc(mul_312_276);
        number tap_314_278 = this->gen_01_delay_19_read(trunc_313_277, 0);
        number mul_315_279 = tap_314_278 * input_diffusion_249_213;
        number decay_diffusion_316_280 = decay_diffusion_300_264;
        number sample_rate_317_281 = sample_rate_78_42;
        number mul_318_282 = sample_rate_317_281 * 0.124995;
        number trunc_319_283 = trunc(mul_318_282);
        number tap_320_284 = this->gen_01_delay_20_read(trunc_319_283, 0);
        number tap3R_321_285 = tap_320_284;
        number mul_322_286 = tap3R_321_285 * 0.6;
        number mul_323_287 = tap_320_284 * decay_240_204;
        number tank1_out_R_324_288 = mul_323_287;
        number sample_rate_325_289 = sample_rate_78_42;
        number mul_326_290 = sample_rate_325_289 * 0.10628;
        number trunc_327_291 = trunc(mul_326_290);
        number tap_328_292 = this->gen_01_delay_21_read(trunc_327_291, 0);
        number mul_329_293 = tap_328_292 * decay_177_141;
        number tank2_out_L_330_294 = mul_329_293;
        number tap3L_331_295 = tap_328_292;
        number mul_332_296 = tap3L_331_295 * 0.6;
        number sample_rate_333_297 = sample_rate_78_42;
        number mul_334_298 = sample_rate_333_297 * 0.012734;
        number trunc_335_299 = trunc(mul_334_298);
        number tap_336_300 = this->gen_01_delay_22_read(trunc_335_299, 0);
        number mul_337_301 = tap_336_300 * input_diffusion_244_208;
        number mul_339_303 = mix_93_57 * decay_338_302;
        number sample_rate_340_304 = sample_rate_78_42;
        number mul_341_305 = sample_rate_340_304 * 0.060481;
        number trunc_342_306 = trunc(mul_341_305);
        number tap_343_307 = this->gen_01_delay_23_read(trunc_342_306, 0);
        number tap2R_344_308 = tap_343_307;
        number mul_345_309 = tap2R_344_308 * 0.6;
        number sub_346_310 = mul_170_134 - mul_345_309;
        number add_347_311 = sub_346_310 + mul_322_286;
        number sub_348_312 = add_347_311 - mul_100_64;
        number sub_349_313 = sub_348_312 - mul_257_221;
        number sub_350_314 = sub_349_313 - mul_176_140;
        number mul_351_315 = tap_343_307 * decay_diffusion_316_280;
        number sub_352_316 = mul_339_303 - mul_351_315;
        number mul_353_317 = sub_352_316 * decay_diffusion_316_280;
        number add_354_318 = mul_353_317 + tap_343_307;
        number input_diffusion_355_319 = float_242_206;
        number input_diffusion_356_320 = input_diffusion_355_319;
        number mul_358_322 = mix_83_47 * decay_357_321;
        number sample_rate_359_323 = sample_rate_78_42;
        number mul_360_324 = sample_rate_359_323 * 0.089244;
        number trunc_361_325 = trunc(mul_360_324);
        number tap_362_326 = this->gen_01_delay_24_read(trunc_361_325, 0);
        number tap2L_363_327 = tap_362_326;
        number mul_364_328 = tap2L_363_327 * 0.6;
        number sub_365_329 = mul_231_195 - mul_364_328;
        number add_366_330 = sub_365_329 + mul_332_296;
        number sub_367_331 = add_366_330 - mul_104_68;
        number sub_368_332 = sub_367_331 - mul_265_229;
        number sub_369_333 = sub_368_332 - mul_237_201;
        number mul_370_334 = tap_362_326 * decay_diffusion_300_264;
        number sub_371_335 = mul_358_322 - mul_370_334;
        number mul_372_336 = sub_371_335 * decay_diffusion_300_264;
        number add_373_337 = mul_372_336 + tap_362_326;
        number sample_rate_374_338 = sample_rate_78_42;
        number mul_375_339 = sample_rate_374_338 * 0.003595;
        number trunc_376_340 = trunc(mul_375_339);
        number tap_377_341 = this->gen_01_delay_25_read(trunc_376_340, 0);
        number mul_378_342 = tap_377_341 * input_diffusion_356_320;
        number sample_rate_379_343 = sample_rate_78_42;
        number mul_380_344 = sample_rate_379_343 * 0.003595;
        number trunc_381_345 = trunc(mul_380_344);
        number tap_382_346 = this->gen_01_delay_26_read(trunc_381_345, 0);
        number mul_383_347 = tap_382_346 * input_diffusion_355_319;
        number input_diffusion_384_348 = input_diffusion_355_319;
        number input_diffusion_385_349 = input_diffusion_355_319;
        number sample_rate_386_350 = sample_rate_78_42;
        number mul_387_351 = sample_rate_386_350 * 0.004771;
        number trunc_388_352 = trunc(mul_387_351);
        number tap_389_353 = this->gen_01_delay_27_read(trunc_388_352, 0);
        number mul_390_354 = tap_389_353 * input_diffusion_384_348;
        number sub_391_355 = mix_76_40 - mul_390_354;
        number mul_392_356 = sub_391_355 * input_diffusion_384_348;
        number add_393_357 = mul_392_356 + tap_389_353;
        number sub_394_358 = add_393_357 - mul_378_342;
        number mul_395_359 = sub_394_358 * input_diffusion_356_320;
        number add_396_360 = mul_395_359 + tap_377_341;
        number sub_397_361 = add_396_360 - mul_315_279;
        number mul_398_362 = sub_397_361 * input_diffusion_249_213;
        number add_399_363 = mul_398_362 + tap_314_278;
        number sub_400_364 = add_399_363 - mul_246_210;
        number mul_401_365 = sub_400_364 * input_diffusion_245_209;
        number add_402_366 = mul_401_365 + tap_168_132;
        number mul_403_367 = add_402_366 * 0.6;
        number early_reflections_R_404_368 = mul_403_367 + mul_164_128;
        number latch_405_370 = this->gen_01_latch_369_next(sub_350_314 + early_reflections_R_404_368, triggerlatch_59_22);
        number dcblock_406_372 = this->gen_01_dcblock_371_next(latch_405_370, 0.9997);
        out2[(Index)i] = dcblock_406_372;
        number add_407_373 = add_402_366 + tank2_out_R_182_146;
        number add_408_374 = add_407_373 + mul_298_262;
        number mul_409_375 = add_408_374 * decay_diffusion_64_28;
        number sub_410_376 = mul_409_375 - tap_297_261;
        number add_411_377 = add_402_366 + tank1_out_R_324_288;
        number add_412_378 = add_411_377 + mul_274_238;
        number mul_413_379 = add_412_378 * decay_diffusion_67_31;
        number sub_414_380 = mul_413_379 - tap_273_237;
        number sample_rate_415_381 = sample_rate_78_42;
        number mul_416_382 = sample_rate_415_381 * 0.004771;
        number trunc_417_383 = trunc(mul_416_382);
        number tap_418_384 = this->gen_01_delay_28_read(trunc_417_383, 0);
        number mul_419_385 = tap_418_384 * input_diffusion_385_349;
        number sub_420_386 = mix_73_37 - mul_419_385;
        number mul_421_387 = sub_420_386 * input_diffusion_385_349;
        number add_422_388 = mul_421_387 + tap_418_384;
        number sub_423_389 = add_422_388 - mul_383_347;
        number mul_424_390 = sub_423_389 * input_diffusion_355_319;
        number add_425_391 = mul_424_390 + tap_382_346;
        number sub_426_392 = add_425_391 - mul_337_301;
        number mul_427_393 = sub_426_392 * input_diffusion_244_208;
        number add_428_394 = mul_427_393 + tap_336_300;
        number sub_429_395 = add_428_394 - mul_248_212;
        number mul_430_396 = sub_429_395 * input_diffusion_247_211;
        number add_431_397 = mul_430_396 + tap_229_193;
        number mul_432_398 = add_431_397 * 0.6;
        number early_reflections_L_433_399 = mul_432_398 + mul_225_189;
        number latch_434_401 = this->gen_01_latch_400_next(sub_369_333 + early_reflections_L_433_399, triggerlatch_60_23);
        number dcblock_435_403 = this->gen_01_dcblock_402_next(latch_434_401, 0.9997);
        out1[(Index)i] = dcblock_435_403;
        number add_436_404 = add_431_397 + tank1_out_L_239_203;
        number add_437_405 = add_436_404 + mul_282_246;
        number mul_438_406 = add_437_405 * decay_diffusion_65_29;
        number sub_439_407 = mul_438_406 - tap_281_245;
        number add_440_408 = add_431_397 + tank2_out_L_330_294;
        number add_441_409 = add_440_408 + mul_290_254;
        number mul_442_410 = add_441_409 * decay_diffusion_66_30;
        number sub_443_411 = mul_442_410 - tap_289_253;
        number history_29_next_444_412 = fixdenorm(mix_50_13);
        number history_30_next_445_413 = fixdenorm(mix_52_15);
        number history_31_next_446_414 = fixdenorm(mix_73_37);
        number history_32_next_447_415 = fixdenorm(mix_76_40);
        number history_33_next_448_416 = fixdenorm(mix_83_47);
        number history_34_next_449_417 = fixdenorm(mix_88_52);
        number history_35_next_450_418 = fixdenorm(mix_93_57);
        number history_36_next_451_419 = fixdenorm(mix_98_62);
        this->gen_01_delay_1_write(latch_62_26);
        __gen_01_history_36_value = history_36_next_451_419;
        __gen_01_history_35_value = history_35_next_450_418;
        __gen_01_history_34_value = history_34_next_449_417;
        __gen_01_history_33_value = history_33_next_448_416;
        __gen_01_history_32_value = history_32_next_447_415;
        __gen_01_history_31_value = history_31_next_446_414;
        __gen_01_history_30_value = history_30_next_445_413;
        __gen_01_history_29_value = history_29_next_444_412;
        this->gen_01_delay_28_write(sub_420_386);
        this->gen_01_delay_27_write(sub_391_355);
        this->gen_01_delay_26_write(sub_423_389);
        this->gen_01_delay_25_write(sub_394_358);
        this->gen_01_delay_24_write(sub_371_335);
        this->gen_01_delay_23_write(sub_352_316);
        this->gen_01_delay_22_write(sub_426_392);
        this->gen_01_delay_21_write(add_373_337);
        this->gen_01_delay_20_write(add_354_318);
        this->gen_01_delay_19_write(sub_397_361);
        this->gen_01_delay_18_write(add_408_374);
        this->gen_01_delay_17_write(add_441_409);
        this->gen_01_delay_16_write(add_437_405);
        this->gen_01_delay_15_write(add_412_378);
        this->gen_01_delay_14_write(sub_308_272);
        this->gen_01_delay_13_write(sub_303_267);
        this->gen_01_delay_12_write(add_310_274);
        this->gen_01_delay_11_write(sub_429_395);
        this->gen_01_delay_10_write(mix_73_37);
        this->gen_01_delay_9_write(add_305_269);
        this->gen_01_delay_8_write(sub_400_364);
        this->gen_01_delay_7_write(mix_76_40);
        this->gen_01_delay_6_write(sub_414_380);
        this->gen_01_delay_5_write(sub_410_376);
        this->gen_01_delay_4_write(sub_443_411);
        this->gen_01_delay_3_write(sub_439_407);
        this->gen_01_delay_2_write(latch_58_21);
        this->gen_01_delay_1_step();
        this->gen_01_delay_2_step();
        this->gen_01_delay_3_step();
        this->gen_01_delay_4_step();
        this->gen_01_delay_5_step();
        this->gen_01_delay_6_step();
        this->gen_01_delay_7_step();
        this->gen_01_delay_8_step();
        this->gen_01_delay_9_step();
        this->gen_01_delay_10_step();
        this->gen_01_delay_11_step();
        this->gen_01_delay_12_step();
        this->gen_01_delay_13_step();
        this->gen_01_delay_14_step();
        this->gen_01_delay_15_step();
        this->gen_01_delay_16_step();
        this->gen_01_delay_17_step();
        this->gen_01_delay_18_step();
        this->gen_01_delay_19_step();
        this->gen_01_delay_20_step();
        this->gen_01_delay_21_step();
        this->gen_01_delay_22_step();
        this->gen_01_delay_23_step();
        this->gen_01_delay_24_step();
        this->gen_01_delay_25_step();
        this->gen_01_delay_26_step();
        this->gen_01_delay_27_step();
        this->gen_01_delay_28_step();
    }

    this->gen_01_history_29_value = __gen_01_history_29_value;
    this->gen_01_history_30_value = __gen_01_history_30_value;
    this->gen_01_history_31_value = __gen_01_history_31_value;
    this->gen_01_history_32_value = __gen_01_history_32_value;
    this->gen_01_history_33_value = __gen_01_history_33_value;
    this->gen_01_history_34_value = __gen_01_history_34_value;
    this->gen_01_history_35_value = __gen_01_history_35_value;
    this->gen_01_history_36_value = __gen_01_history_36_value;
}

void dspexpr_01_perform(const Sample * in1, const Sample * in2, SampleValue * out1, Index n) {
    Index i;

    for (i = 0; i < (Index)n; i++) {
        out1[(Index)i] = in1[(Index)i] * in2[(Index)i];//#map:_###_obj_###_:1
    }
}

void signaladder_01_perform(
    const SampleValue * in1,
    const SampleValue * in2,
    SampleValue * out,
    Index n
) {
    Index i;

    for (i = 0; i < (Index)n; i++) {
        out[(Index)i] = in1[(Index)i] + in2[(Index)i];
    }
}

void dspexpr_02_perform(const Sample * in1, const Sample * in2, SampleValue * out1, Index n) {
    Index i;

    for (i = 0; i < (Index)n; i++) {
        out1[(Index)i] = in1[(Index)i] * in2[(Index)i];//#map:_###_obj_###_:1
    }
}

void dspexpr_04_perform(const Sample * in1, const Sample * in2, SampleValue * out1, Index n) {
    Index i;

    for (i = 0; i < (Index)n; i++) {
        out1[(Index)i] = in1[(Index)i] * in2[(Index)i];//#map:_###_obj_###_:1
    }
}

void signaladder_02_perform(
    const SampleValue * in1,
    const SampleValue * in2,
    SampleValue * out,
    Index n
) {
    Index i;

    for (i = 0; i < (Index)n; i++) {
        out[(Index)i] = in1[(Index)i] + in2[(Index)i];
    }
}

void stackprotect_perform(Index n) {
    RNBO_UNUSED(n);
    auto __stackprotect_count = this->stackprotect_count;
    __stackprotect_count = 0;
    this->stackprotect_count = __stackprotect_count;
}

void param_01_getPresetValue(PatcherStateInterface& preset) {
    preset["value"] = this->param_01_value;
}

void param_01_setPresetValue(PatcherStateInterface& preset) {
    if ((bool)(stateIsEmpty(preset)))
        return;

    this->param_01_value_set(preset["value"]);
}

void param_02_getPresetValue(PatcherStateInterface& preset) {
    preset["value"] = this->param_02_value;
}

void param_02_setPresetValue(PatcherStateInterface& preset) {
    if ((bool)(stateIsEmpty(preset)))
        return;

    this->param_02_value_set(preset["value"]);
}

void param_03_getPresetValue(PatcherStateInterface& preset) {
    preset["value"] = this->param_03_value;
}

void param_03_setPresetValue(PatcherStateInterface& preset) {
    if ((bool)(stateIsEmpty(preset)))
        return;

    this->param_03_value_set(preset["value"]);
}

void gen_01_delay_1_step() {
    this->gen_01_delay_1_reader++;

    if (this->gen_01_delay_1_reader >= (Int)(this->gen_01_delay_1_buffer->getSize()))
        this->gen_01_delay_1_reader = 0;
}

number gen_01_delay_1_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_1_buffer->getSize()) + this->gen_01_delay_1_reader - ((size > this->gen_01_delay_1__maxdelay ? this->gen_01_delay_1__maxdelay : (size < (this->gen_01_delay_1_reader != this->gen_01_delay_1_writer) ? this->gen_01_delay_1_reader != this->gen_01_delay_1_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_1_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_1_wrap))
        ), this->gen_01_delay_1_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_1_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_1_buffer->getSize()) + this->gen_01_delay_1_reader - ((size > this->gen_01_delay_1__maxdelay ? this->gen_01_delay_1__maxdelay : (size < (this->gen_01_delay_1_reader != this->gen_01_delay_1_writer) ? this->gen_01_delay_1_reader != this->gen_01_delay_1_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_1_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_1_wrap))
    );
}

void gen_01_delay_1_write(number v) {
    this->gen_01_delay_1_writer = this->gen_01_delay_1_reader;
    this->gen_01_delay_1_buffer[(Index)this->gen_01_delay_1_writer] = v;
}

number gen_01_delay_1_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_1__maxdelay : size);
    number val = this->gen_01_delay_1_read(effectiveSize, 0);
    this->gen_01_delay_1_write(v);
    this->gen_01_delay_1_step();
    return val;
}

array<Index, 2> gen_01_delay_1_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_1_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_1_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_1_init() {
    auto result = this->gen_01_delay_1_calcSizeInSamples();
    this->gen_01_delay_1__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_1_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_1_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_1_clear() {
    this->gen_01_delay_1_buffer->setZero();
}

void gen_01_delay_1_reset() {
    auto result = this->gen_01_delay_1_calcSizeInSamples();
    this->gen_01_delay_1__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_1_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_1_buffer);
    this->gen_01_delay_1_wrap = this->gen_01_delay_1_buffer->getSize() - 1;
    this->gen_01_delay_1_clear();

    if (this->gen_01_delay_1_reader >= this->gen_01_delay_1__maxdelay || this->gen_01_delay_1_writer >= this->gen_01_delay_1__maxdelay) {
        this->gen_01_delay_1_reader = 0;
        this->gen_01_delay_1_writer = 0;
    }
}

void gen_01_delay_1_dspsetup() {
    this->gen_01_delay_1_reset();
}

number gen_01_delay_1_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 2;
}

number gen_01_delay_1_size() {
    return this->gen_01_delay_1__maxdelay;
}

void gen_01_delay_2_step() {
    this->gen_01_delay_2_reader++;

    if (this->gen_01_delay_2_reader >= (Int)(this->gen_01_delay_2_buffer->getSize()))
        this->gen_01_delay_2_reader = 0;
}

number gen_01_delay_2_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_2_buffer->getSize()) + this->gen_01_delay_2_reader - ((size > this->gen_01_delay_2__maxdelay ? this->gen_01_delay_2__maxdelay : (size < (this->gen_01_delay_2_reader != this->gen_01_delay_2_writer) ? this->gen_01_delay_2_reader != this->gen_01_delay_2_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_2_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_2_wrap))
        ), this->gen_01_delay_2_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_2_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_2_buffer->getSize()) + this->gen_01_delay_2_reader - ((size > this->gen_01_delay_2__maxdelay ? this->gen_01_delay_2__maxdelay : (size < (this->gen_01_delay_2_reader != this->gen_01_delay_2_writer) ? this->gen_01_delay_2_reader != this->gen_01_delay_2_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_2_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_2_wrap))
    );
}

void gen_01_delay_2_write(number v) {
    this->gen_01_delay_2_writer = this->gen_01_delay_2_reader;
    this->gen_01_delay_2_buffer[(Index)this->gen_01_delay_2_writer] = v;
}

number gen_01_delay_2_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_2__maxdelay : size);
    number val = this->gen_01_delay_2_read(effectiveSize, 0);
    this->gen_01_delay_2_write(v);
    this->gen_01_delay_2_step();
    return val;
}

array<Index, 2> gen_01_delay_2_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_2_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_2_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_2_init() {
    auto result = this->gen_01_delay_2_calcSizeInSamples();
    this->gen_01_delay_2__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_2_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_2_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_2_clear() {
    this->gen_01_delay_2_buffer->setZero();
}

void gen_01_delay_2_reset() {
    auto result = this->gen_01_delay_2_calcSizeInSamples();
    this->gen_01_delay_2__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_2_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_2_buffer);
    this->gen_01_delay_2_wrap = this->gen_01_delay_2_buffer->getSize() - 1;
    this->gen_01_delay_2_clear();

    if (this->gen_01_delay_2_reader >= this->gen_01_delay_2__maxdelay || this->gen_01_delay_2_writer >= this->gen_01_delay_2__maxdelay) {
        this->gen_01_delay_2_reader = 0;
        this->gen_01_delay_2_writer = 0;
    }
}

void gen_01_delay_2_dspsetup() {
    this->gen_01_delay_2_reset();
}

number gen_01_delay_2_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 2;
}

number gen_01_delay_2_size() {
    return this->gen_01_delay_2__maxdelay;
}

void gen_01_delay_3_step() {
    this->gen_01_delay_3_reader++;

    if (this->gen_01_delay_3_reader >= (Int)(this->gen_01_delay_3_buffer->getSize()))
        this->gen_01_delay_3_reader = 0;
}

number gen_01_delay_3_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_3_buffer->getSize()) + this->gen_01_delay_3_reader - ((size > this->gen_01_delay_3__maxdelay ? this->gen_01_delay_3__maxdelay : (size < (this->gen_01_delay_3_reader != this->gen_01_delay_3_writer) ? this->gen_01_delay_3_reader != this->gen_01_delay_3_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_3_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_3_wrap))
        ), this->gen_01_delay_3_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_3_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_3_buffer->getSize()) + this->gen_01_delay_3_reader - ((size > this->gen_01_delay_3__maxdelay ? this->gen_01_delay_3__maxdelay : (size < (this->gen_01_delay_3_reader != this->gen_01_delay_3_writer) ? this->gen_01_delay_3_reader != this->gen_01_delay_3_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_3_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_3_wrap))
    );
}

void gen_01_delay_3_write(number v) {
    this->gen_01_delay_3_writer = this->gen_01_delay_3_reader;
    this->gen_01_delay_3_buffer[(Index)this->gen_01_delay_3_writer] = v;
}

number gen_01_delay_3_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_3__maxdelay : size);
    number val = this->gen_01_delay_3_read(effectiveSize, 0);
    this->gen_01_delay_3_write(v);
    this->gen_01_delay_3_step();
    return val;
}

array<Index, 2> gen_01_delay_3_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_3_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_3_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_3_init() {
    auto result = this->gen_01_delay_3_calcSizeInSamples();
    this->gen_01_delay_3__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_3_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_3_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_3_clear() {
    this->gen_01_delay_3_buffer->setZero();
}

void gen_01_delay_3_reset() {
    auto result = this->gen_01_delay_3_calcSizeInSamples();
    this->gen_01_delay_3__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_3_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_3_buffer);
    this->gen_01_delay_3_wrap = this->gen_01_delay_3_buffer->getSize() - 1;
    this->gen_01_delay_3_clear();

    if (this->gen_01_delay_3_reader >= this->gen_01_delay_3__maxdelay || this->gen_01_delay_3_writer >= this->gen_01_delay_3__maxdelay) {
        this->gen_01_delay_3_reader = 0;
        this->gen_01_delay_3_writer = 0;
    }
}

void gen_01_delay_3_dspsetup() {
    this->gen_01_delay_3_reset();
}

number gen_01_delay_3_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_3_size() {
    return this->gen_01_delay_3__maxdelay;
}

void gen_01_delay_4_step() {
    this->gen_01_delay_4_reader++;

    if (this->gen_01_delay_4_reader >= (Int)(this->gen_01_delay_4_buffer->getSize()))
        this->gen_01_delay_4_reader = 0;
}

number gen_01_delay_4_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_4_buffer->getSize()) + this->gen_01_delay_4_reader - ((size > this->gen_01_delay_4__maxdelay ? this->gen_01_delay_4__maxdelay : (size < (this->gen_01_delay_4_reader != this->gen_01_delay_4_writer) ? this->gen_01_delay_4_reader != this->gen_01_delay_4_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_4_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_4_wrap))
        ), this->gen_01_delay_4_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_4_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_4_buffer->getSize()) + this->gen_01_delay_4_reader - ((size > this->gen_01_delay_4__maxdelay ? this->gen_01_delay_4__maxdelay : (size < (this->gen_01_delay_4_reader != this->gen_01_delay_4_writer) ? this->gen_01_delay_4_reader != this->gen_01_delay_4_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_4_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_4_wrap))
    );
}

void gen_01_delay_4_write(number v) {
    this->gen_01_delay_4_writer = this->gen_01_delay_4_reader;
    this->gen_01_delay_4_buffer[(Index)this->gen_01_delay_4_writer] = v;
}

number gen_01_delay_4_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_4__maxdelay : size);
    number val = this->gen_01_delay_4_read(effectiveSize, 0);
    this->gen_01_delay_4_write(v);
    this->gen_01_delay_4_step();
    return val;
}

array<Index, 2> gen_01_delay_4_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_4_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_4_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_4_init() {
    auto result = this->gen_01_delay_4_calcSizeInSamples();
    this->gen_01_delay_4__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_4_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_4_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_4_clear() {
    this->gen_01_delay_4_buffer->setZero();
}

void gen_01_delay_4_reset() {
    auto result = this->gen_01_delay_4_calcSizeInSamples();
    this->gen_01_delay_4__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_4_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_4_buffer);
    this->gen_01_delay_4_wrap = this->gen_01_delay_4_buffer->getSize() - 1;
    this->gen_01_delay_4_clear();

    if (this->gen_01_delay_4_reader >= this->gen_01_delay_4__maxdelay || this->gen_01_delay_4_writer >= this->gen_01_delay_4__maxdelay) {
        this->gen_01_delay_4_reader = 0;
        this->gen_01_delay_4_writer = 0;
    }
}

void gen_01_delay_4_dspsetup() {
    this->gen_01_delay_4_reset();
}

number gen_01_delay_4_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_4_size() {
    return this->gen_01_delay_4__maxdelay;
}

void gen_01_delay_5_step() {
    this->gen_01_delay_5_reader++;

    if (this->gen_01_delay_5_reader >= (Int)(this->gen_01_delay_5_buffer->getSize()))
        this->gen_01_delay_5_reader = 0;
}

number gen_01_delay_5_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_5_buffer->getSize()) + this->gen_01_delay_5_reader - ((size > this->gen_01_delay_5__maxdelay ? this->gen_01_delay_5__maxdelay : (size < (this->gen_01_delay_5_reader != this->gen_01_delay_5_writer) ? this->gen_01_delay_5_reader != this->gen_01_delay_5_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_5_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_5_wrap))
        ), this->gen_01_delay_5_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_5_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_5_buffer->getSize()) + this->gen_01_delay_5_reader - ((size > this->gen_01_delay_5__maxdelay ? this->gen_01_delay_5__maxdelay : (size < (this->gen_01_delay_5_reader != this->gen_01_delay_5_writer) ? this->gen_01_delay_5_reader != this->gen_01_delay_5_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_5_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_5_wrap))
    );
}

void gen_01_delay_5_write(number v) {
    this->gen_01_delay_5_writer = this->gen_01_delay_5_reader;
    this->gen_01_delay_5_buffer[(Index)this->gen_01_delay_5_writer] = v;
}

number gen_01_delay_5_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_5__maxdelay : size);
    number val = this->gen_01_delay_5_read(effectiveSize, 0);
    this->gen_01_delay_5_write(v);
    this->gen_01_delay_5_step();
    return val;
}

array<Index, 2> gen_01_delay_5_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_5_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_5_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_5_init() {
    auto result = this->gen_01_delay_5_calcSizeInSamples();
    this->gen_01_delay_5__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_5_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_5_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_5_clear() {
    this->gen_01_delay_5_buffer->setZero();
}

void gen_01_delay_5_reset() {
    auto result = this->gen_01_delay_5_calcSizeInSamples();
    this->gen_01_delay_5__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_5_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_5_buffer);
    this->gen_01_delay_5_wrap = this->gen_01_delay_5_buffer->getSize() - 1;
    this->gen_01_delay_5_clear();

    if (this->gen_01_delay_5_reader >= this->gen_01_delay_5__maxdelay || this->gen_01_delay_5_writer >= this->gen_01_delay_5__maxdelay) {
        this->gen_01_delay_5_reader = 0;
        this->gen_01_delay_5_writer = 0;
    }
}

void gen_01_delay_5_dspsetup() {
    this->gen_01_delay_5_reset();
}

number gen_01_delay_5_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_5_size() {
    return this->gen_01_delay_5__maxdelay;
}

void gen_01_delay_6_step() {
    this->gen_01_delay_6_reader++;

    if (this->gen_01_delay_6_reader >= (Int)(this->gen_01_delay_6_buffer->getSize()))
        this->gen_01_delay_6_reader = 0;
}

number gen_01_delay_6_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_6_buffer->getSize()) + this->gen_01_delay_6_reader - ((size > this->gen_01_delay_6__maxdelay ? this->gen_01_delay_6__maxdelay : (size < (this->gen_01_delay_6_reader != this->gen_01_delay_6_writer) ? this->gen_01_delay_6_reader != this->gen_01_delay_6_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_6_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_6_wrap))
        ), this->gen_01_delay_6_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_6_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_6_buffer->getSize()) + this->gen_01_delay_6_reader - ((size > this->gen_01_delay_6__maxdelay ? this->gen_01_delay_6__maxdelay : (size < (this->gen_01_delay_6_reader != this->gen_01_delay_6_writer) ? this->gen_01_delay_6_reader != this->gen_01_delay_6_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_6_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_6_wrap))
    );
}

void gen_01_delay_6_write(number v) {
    this->gen_01_delay_6_writer = this->gen_01_delay_6_reader;
    this->gen_01_delay_6_buffer[(Index)this->gen_01_delay_6_writer] = v;
}

number gen_01_delay_6_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_6__maxdelay : size);
    number val = this->gen_01_delay_6_read(effectiveSize, 0);
    this->gen_01_delay_6_write(v);
    this->gen_01_delay_6_step();
    return val;
}

array<Index, 2> gen_01_delay_6_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_6_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_6_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_6_init() {
    auto result = this->gen_01_delay_6_calcSizeInSamples();
    this->gen_01_delay_6__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_6_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_6_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_6_clear() {
    this->gen_01_delay_6_buffer->setZero();
}

void gen_01_delay_6_reset() {
    auto result = this->gen_01_delay_6_calcSizeInSamples();
    this->gen_01_delay_6__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_6_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_6_buffer);
    this->gen_01_delay_6_wrap = this->gen_01_delay_6_buffer->getSize() - 1;
    this->gen_01_delay_6_clear();

    if (this->gen_01_delay_6_reader >= this->gen_01_delay_6__maxdelay || this->gen_01_delay_6_writer >= this->gen_01_delay_6__maxdelay) {
        this->gen_01_delay_6_reader = 0;
        this->gen_01_delay_6_writer = 0;
    }
}

void gen_01_delay_6_dspsetup() {
    this->gen_01_delay_6_reset();
}

number gen_01_delay_6_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_6_size() {
    return this->gen_01_delay_6__maxdelay;
}

void gen_01_delay_7_step() {
    this->gen_01_delay_7_reader++;

    if (this->gen_01_delay_7_reader >= (Int)(this->gen_01_delay_7_buffer->getSize()))
        this->gen_01_delay_7_reader = 0;
}

number gen_01_delay_7_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_7_buffer->getSize()) + this->gen_01_delay_7_reader - ((size > this->gen_01_delay_7__maxdelay ? this->gen_01_delay_7__maxdelay : (size < (this->gen_01_delay_7_reader != this->gen_01_delay_7_writer) ? this->gen_01_delay_7_reader != this->gen_01_delay_7_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_7_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_7_wrap))
        ), this->gen_01_delay_7_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_7_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_7_buffer->getSize()) + this->gen_01_delay_7_reader - ((size > this->gen_01_delay_7__maxdelay ? this->gen_01_delay_7__maxdelay : (size < (this->gen_01_delay_7_reader != this->gen_01_delay_7_writer) ? this->gen_01_delay_7_reader != this->gen_01_delay_7_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_7_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_7_wrap))
    );
}

void gen_01_delay_7_write(number v) {
    this->gen_01_delay_7_writer = this->gen_01_delay_7_reader;
    this->gen_01_delay_7_buffer[(Index)this->gen_01_delay_7_writer] = v;
}

number gen_01_delay_7_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_7__maxdelay : size);
    number val = this->gen_01_delay_7_read(effectiveSize, 0);
    this->gen_01_delay_7_write(v);
    this->gen_01_delay_7_step();
    return val;
}

array<Index, 2> gen_01_delay_7_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_7_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_7_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_7_init() {
    auto result = this->gen_01_delay_7_calcSizeInSamples();
    this->gen_01_delay_7__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_7_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_7_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_7_clear() {
    this->gen_01_delay_7_buffer->setZero();
}

void gen_01_delay_7_reset() {
    auto result = this->gen_01_delay_7_calcSizeInSamples();
    this->gen_01_delay_7__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_7_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_7_buffer);
    this->gen_01_delay_7_wrap = this->gen_01_delay_7_buffer->getSize() - 1;
    this->gen_01_delay_7_clear();

    if (this->gen_01_delay_7_reader >= this->gen_01_delay_7__maxdelay || this->gen_01_delay_7_writer >= this->gen_01_delay_7__maxdelay) {
        this->gen_01_delay_7_reader = 0;
        this->gen_01_delay_7_writer = 0;
    }
}

void gen_01_delay_7_dspsetup() {
    this->gen_01_delay_7_reset();
}

number gen_01_delay_7_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_7_size() {
    return this->gen_01_delay_7__maxdelay;
}

void gen_01_delay_8_step() {
    this->gen_01_delay_8_reader++;

    if (this->gen_01_delay_8_reader >= (Int)(this->gen_01_delay_8_buffer->getSize()))
        this->gen_01_delay_8_reader = 0;
}

number gen_01_delay_8_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_8_buffer->getSize()) + this->gen_01_delay_8_reader - ((size > this->gen_01_delay_8__maxdelay ? this->gen_01_delay_8__maxdelay : (size < (this->gen_01_delay_8_reader != this->gen_01_delay_8_writer) ? this->gen_01_delay_8_reader != this->gen_01_delay_8_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_8_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_8_wrap))
        ), this->gen_01_delay_8_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_8_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_8_buffer->getSize()) + this->gen_01_delay_8_reader - ((size > this->gen_01_delay_8__maxdelay ? this->gen_01_delay_8__maxdelay : (size < (this->gen_01_delay_8_reader != this->gen_01_delay_8_writer) ? this->gen_01_delay_8_reader != this->gen_01_delay_8_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_8_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_8_wrap))
    );
}

void gen_01_delay_8_write(number v) {
    this->gen_01_delay_8_writer = this->gen_01_delay_8_reader;
    this->gen_01_delay_8_buffer[(Index)this->gen_01_delay_8_writer] = v;
}

number gen_01_delay_8_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_8__maxdelay : size);
    number val = this->gen_01_delay_8_read(effectiveSize, 0);
    this->gen_01_delay_8_write(v);
    this->gen_01_delay_8_step();
    return val;
}

array<Index, 2> gen_01_delay_8_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_8_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_8_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_8_init() {
    auto result = this->gen_01_delay_8_calcSizeInSamples();
    this->gen_01_delay_8__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_8_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_8_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_8_clear() {
    this->gen_01_delay_8_buffer->setZero();
}

void gen_01_delay_8_reset() {
    auto result = this->gen_01_delay_8_calcSizeInSamples();
    this->gen_01_delay_8__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_8_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_8_buffer);
    this->gen_01_delay_8_wrap = this->gen_01_delay_8_buffer->getSize() - 1;
    this->gen_01_delay_8_clear();

    if (this->gen_01_delay_8_reader >= this->gen_01_delay_8__maxdelay || this->gen_01_delay_8_writer >= this->gen_01_delay_8__maxdelay) {
        this->gen_01_delay_8_reader = 0;
        this->gen_01_delay_8_writer = 0;
    }
}

void gen_01_delay_8_dspsetup() {
    this->gen_01_delay_8_reset();
}

number gen_01_delay_8_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 2;
}

number gen_01_delay_8_size() {
    return this->gen_01_delay_8__maxdelay;
}

void gen_01_delay_9_step() {
    this->gen_01_delay_9_reader++;

    if (this->gen_01_delay_9_reader >= (Int)(this->gen_01_delay_9_buffer->getSize()))
        this->gen_01_delay_9_reader = 0;
}

number gen_01_delay_9_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_9_buffer->getSize()) + this->gen_01_delay_9_reader - ((size > this->gen_01_delay_9__maxdelay ? this->gen_01_delay_9__maxdelay : (size < (this->gen_01_delay_9_reader != this->gen_01_delay_9_writer) ? this->gen_01_delay_9_reader != this->gen_01_delay_9_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_9_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_9_wrap))
        ), this->gen_01_delay_9_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_9_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_9_buffer->getSize()) + this->gen_01_delay_9_reader - ((size > this->gen_01_delay_9__maxdelay ? this->gen_01_delay_9__maxdelay : (size < (this->gen_01_delay_9_reader != this->gen_01_delay_9_writer) ? this->gen_01_delay_9_reader != this->gen_01_delay_9_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_9_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_9_wrap))
    );
}

void gen_01_delay_9_write(number v) {
    this->gen_01_delay_9_writer = this->gen_01_delay_9_reader;
    this->gen_01_delay_9_buffer[(Index)this->gen_01_delay_9_writer] = v;
}

number gen_01_delay_9_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_9__maxdelay : size);
    number val = this->gen_01_delay_9_read(effectiveSize, 0);
    this->gen_01_delay_9_write(v);
    this->gen_01_delay_9_step();
    return val;
}

array<Index, 2> gen_01_delay_9_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_9_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_9_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_9_init() {
    auto result = this->gen_01_delay_9_calcSizeInSamples();
    this->gen_01_delay_9__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_9_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_9_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_9_clear() {
    this->gen_01_delay_9_buffer->setZero();
}

void gen_01_delay_9_reset() {
    auto result = this->gen_01_delay_9_calcSizeInSamples();
    this->gen_01_delay_9__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_9_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_9_buffer);
    this->gen_01_delay_9_wrap = this->gen_01_delay_9_buffer->getSize() - 1;
    this->gen_01_delay_9_clear();

    if (this->gen_01_delay_9_reader >= this->gen_01_delay_9__maxdelay || this->gen_01_delay_9_writer >= this->gen_01_delay_9__maxdelay) {
        this->gen_01_delay_9_reader = 0;
        this->gen_01_delay_9_writer = 0;
    }
}

void gen_01_delay_9_dspsetup() {
    this->gen_01_delay_9_reset();
}

number gen_01_delay_9_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_9_size() {
    return this->gen_01_delay_9__maxdelay;
}

void gen_01_delay_10_step() {
    this->gen_01_delay_10_reader++;

    if (this->gen_01_delay_10_reader >= (Int)(this->gen_01_delay_10_buffer->getSize()))
        this->gen_01_delay_10_reader = 0;
}

number gen_01_delay_10_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_10_buffer->getSize()) + this->gen_01_delay_10_reader - ((size > this->gen_01_delay_10__maxdelay ? this->gen_01_delay_10__maxdelay : (size < (this->gen_01_delay_10_reader != this->gen_01_delay_10_writer) ? this->gen_01_delay_10_reader != this->gen_01_delay_10_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_10_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_10_wrap))
        ), this->gen_01_delay_10_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_10_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_10_buffer->getSize()) + this->gen_01_delay_10_reader - ((size > this->gen_01_delay_10__maxdelay ? this->gen_01_delay_10__maxdelay : (size < (this->gen_01_delay_10_reader != this->gen_01_delay_10_writer) ? this->gen_01_delay_10_reader != this->gen_01_delay_10_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_10_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_10_wrap))
    );
}

void gen_01_delay_10_write(number v) {
    this->gen_01_delay_10_writer = this->gen_01_delay_10_reader;
    this->gen_01_delay_10_buffer[(Index)this->gen_01_delay_10_writer] = v;
}

number gen_01_delay_10_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_10__maxdelay : size);
    number val = this->gen_01_delay_10_read(effectiveSize, 0);
    this->gen_01_delay_10_write(v);
    this->gen_01_delay_10_step();
    return val;
}

array<Index, 2> gen_01_delay_10_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_10_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_10_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_10_init() {
    auto result = this->gen_01_delay_10_calcSizeInSamples();
    this->gen_01_delay_10__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_10_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_10_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_10_clear() {
    this->gen_01_delay_10_buffer->setZero();
}

void gen_01_delay_10_reset() {
    auto result = this->gen_01_delay_10_calcSizeInSamples();
    this->gen_01_delay_10__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_10_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_10_buffer);
    this->gen_01_delay_10_wrap = this->gen_01_delay_10_buffer->getSize() - 1;
    this->gen_01_delay_10_clear();

    if (this->gen_01_delay_10_reader >= this->gen_01_delay_10__maxdelay || this->gen_01_delay_10_writer >= this->gen_01_delay_10__maxdelay) {
        this->gen_01_delay_10_reader = 0;
        this->gen_01_delay_10_writer = 0;
    }
}

void gen_01_delay_10_dspsetup() {
    this->gen_01_delay_10_reset();
}

number gen_01_delay_10_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_10_size() {
    return this->gen_01_delay_10__maxdelay;
}

void gen_01_delay_11_step() {
    this->gen_01_delay_11_reader++;

    if (this->gen_01_delay_11_reader >= (Int)(this->gen_01_delay_11_buffer->getSize()))
        this->gen_01_delay_11_reader = 0;
}

number gen_01_delay_11_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_11_buffer->getSize()) + this->gen_01_delay_11_reader - ((size > this->gen_01_delay_11__maxdelay ? this->gen_01_delay_11__maxdelay : (size < (this->gen_01_delay_11_reader != this->gen_01_delay_11_writer) ? this->gen_01_delay_11_reader != this->gen_01_delay_11_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_11_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_11_wrap))
        ), this->gen_01_delay_11_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_11_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_11_buffer->getSize()) + this->gen_01_delay_11_reader - ((size > this->gen_01_delay_11__maxdelay ? this->gen_01_delay_11__maxdelay : (size < (this->gen_01_delay_11_reader != this->gen_01_delay_11_writer) ? this->gen_01_delay_11_reader != this->gen_01_delay_11_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_11_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_11_wrap))
    );
}

void gen_01_delay_11_write(number v) {
    this->gen_01_delay_11_writer = this->gen_01_delay_11_reader;
    this->gen_01_delay_11_buffer[(Index)this->gen_01_delay_11_writer] = v;
}

number gen_01_delay_11_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_11__maxdelay : size);
    number val = this->gen_01_delay_11_read(effectiveSize, 0);
    this->gen_01_delay_11_write(v);
    this->gen_01_delay_11_step();
    return val;
}

array<Index, 2> gen_01_delay_11_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_11_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_11_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_11_init() {
    auto result = this->gen_01_delay_11_calcSizeInSamples();
    this->gen_01_delay_11__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_11_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_11_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_11_clear() {
    this->gen_01_delay_11_buffer->setZero();
}

void gen_01_delay_11_reset() {
    auto result = this->gen_01_delay_11_calcSizeInSamples();
    this->gen_01_delay_11__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_11_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_11_buffer);
    this->gen_01_delay_11_wrap = this->gen_01_delay_11_buffer->getSize() - 1;
    this->gen_01_delay_11_clear();

    if (this->gen_01_delay_11_reader >= this->gen_01_delay_11__maxdelay || this->gen_01_delay_11_writer >= this->gen_01_delay_11__maxdelay) {
        this->gen_01_delay_11_reader = 0;
        this->gen_01_delay_11_writer = 0;
    }
}

void gen_01_delay_11_dspsetup() {
    this->gen_01_delay_11_reset();
}

number gen_01_delay_11_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 2;
}

number gen_01_delay_11_size() {
    return this->gen_01_delay_11__maxdelay;
}

void gen_01_delay_12_step() {
    this->gen_01_delay_12_reader++;

    if (this->gen_01_delay_12_reader >= (Int)(this->gen_01_delay_12_buffer->getSize()))
        this->gen_01_delay_12_reader = 0;
}

number gen_01_delay_12_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_12_buffer->getSize()) + this->gen_01_delay_12_reader - ((size > this->gen_01_delay_12__maxdelay ? this->gen_01_delay_12__maxdelay : (size < (this->gen_01_delay_12_reader != this->gen_01_delay_12_writer) ? this->gen_01_delay_12_reader != this->gen_01_delay_12_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_12_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_12_wrap))
        ), this->gen_01_delay_12_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_12_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_12_buffer->getSize()) + this->gen_01_delay_12_reader - ((size > this->gen_01_delay_12__maxdelay ? this->gen_01_delay_12__maxdelay : (size < (this->gen_01_delay_12_reader != this->gen_01_delay_12_writer) ? this->gen_01_delay_12_reader != this->gen_01_delay_12_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_12_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_12_wrap))
    );
}

void gen_01_delay_12_write(number v) {
    this->gen_01_delay_12_writer = this->gen_01_delay_12_reader;
    this->gen_01_delay_12_buffer[(Index)this->gen_01_delay_12_writer] = v;
}

number gen_01_delay_12_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_12__maxdelay : size);
    number val = this->gen_01_delay_12_read(effectiveSize, 0);
    this->gen_01_delay_12_write(v);
    this->gen_01_delay_12_step();
    return val;
}

array<Index, 2> gen_01_delay_12_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_12_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_12_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_12_init() {
    auto result = this->gen_01_delay_12_calcSizeInSamples();
    this->gen_01_delay_12__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_12_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_12_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_12_clear() {
    this->gen_01_delay_12_buffer->setZero();
}

void gen_01_delay_12_reset() {
    auto result = this->gen_01_delay_12_calcSizeInSamples();
    this->gen_01_delay_12__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_12_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_12_buffer);
    this->gen_01_delay_12_wrap = this->gen_01_delay_12_buffer->getSize() - 1;
    this->gen_01_delay_12_clear();

    if (this->gen_01_delay_12_reader >= this->gen_01_delay_12__maxdelay || this->gen_01_delay_12_writer >= this->gen_01_delay_12__maxdelay) {
        this->gen_01_delay_12_reader = 0;
        this->gen_01_delay_12_writer = 0;
    }
}

void gen_01_delay_12_dspsetup() {
    this->gen_01_delay_12_reset();
}

number gen_01_delay_12_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_12_size() {
    return this->gen_01_delay_12__maxdelay;
}

void gen_01_delay_13_step() {
    this->gen_01_delay_13_reader++;

    if (this->gen_01_delay_13_reader >= (Int)(this->gen_01_delay_13_buffer->getSize()))
        this->gen_01_delay_13_reader = 0;
}

number gen_01_delay_13_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_13_buffer->getSize()) + this->gen_01_delay_13_reader - ((size > this->gen_01_delay_13__maxdelay ? this->gen_01_delay_13__maxdelay : (size < (this->gen_01_delay_13_reader != this->gen_01_delay_13_writer) ? this->gen_01_delay_13_reader != this->gen_01_delay_13_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_13_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_13_wrap))
        ), this->gen_01_delay_13_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_13_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_13_buffer->getSize()) + this->gen_01_delay_13_reader - ((size > this->gen_01_delay_13__maxdelay ? this->gen_01_delay_13__maxdelay : (size < (this->gen_01_delay_13_reader != this->gen_01_delay_13_writer) ? this->gen_01_delay_13_reader != this->gen_01_delay_13_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_13_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_13_wrap))
    );
}

void gen_01_delay_13_write(number v) {
    this->gen_01_delay_13_writer = this->gen_01_delay_13_reader;
    this->gen_01_delay_13_buffer[(Index)this->gen_01_delay_13_writer] = v;
}

number gen_01_delay_13_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_13__maxdelay : size);
    number val = this->gen_01_delay_13_read(effectiveSize, 0);
    this->gen_01_delay_13_write(v);
    this->gen_01_delay_13_step();
    return val;
}

array<Index, 2> gen_01_delay_13_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_13_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_13_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_13_init() {
    auto result = this->gen_01_delay_13_calcSizeInSamples();
    this->gen_01_delay_13__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_13_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_13_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_13_clear() {
    this->gen_01_delay_13_buffer->setZero();
}

void gen_01_delay_13_reset() {
    auto result = this->gen_01_delay_13_calcSizeInSamples();
    this->gen_01_delay_13__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_13_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_13_buffer);
    this->gen_01_delay_13_wrap = this->gen_01_delay_13_buffer->getSize() - 1;
    this->gen_01_delay_13_clear();

    if (this->gen_01_delay_13_reader >= this->gen_01_delay_13__maxdelay || this->gen_01_delay_13_writer >= this->gen_01_delay_13__maxdelay) {
        this->gen_01_delay_13_reader = 0;
        this->gen_01_delay_13_writer = 0;
    }
}

void gen_01_delay_13_dspsetup() {
    this->gen_01_delay_13_reset();
}

number gen_01_delay_13_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 10;
}

number gen_01_delay_13_size() {
    return this->gen_01_delay_13__maxdelay;
}

void gen_01_delay_14_step() {
    this->gen_01_delay_14_reader++;

    if (this->gen_01_delay_14_reader >= (Int)(this->gen_01_delay_14_buffer->getSize()))
        this->gen_01_delay_14_reader = 0;
}

number gen_01_delay_14_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_14_buffer->getSize()) + this->gen_01_delay_14_reader - ((size > this->gen_01_delay_14__maxdelay ? this->gen_01_delay_14__maxdelay : (size < (this->gen_01_delay_14_reader != this->gen_01_delay_14_writer) ? this->gen_01_delay_14_reader != this->gen_01_delay_14_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_14_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_14_wrap))
        ), this->gen_01_delay_14_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_14_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_14_buffer->getSize()) + this->gen_01_delay_14_reader - ((size > this->gen_01_delay_14__maxdelay ? this->gen_01_delay_14__maxdelay : (size < (this->gen_01_delay_14_reader != this->gen_01_delay_14_writer) ? this->gen_01_delay_14_reader != this->gen_01_delay_14_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_14_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_14_wrap))
    );
}

void gen_01_delay_14_write(number v) {
    this->gen_01_delay_14_writer = this->gen_01_delay_14_reader;
    this->gen_01_delay_14_buffer[(Index)this->gen_01_delay_14_writer] = v;
}

number gen_01_delay_14_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_14__maxdelay : size);
    number val = this->gen_01_delay_14_read(effectiveSize, 0);
    this->gen_01_delay_14_write(v);
    this->gen_01_delay_14_step();
    return val;
}

array<Index, 2> gen_01_delay_14_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_14_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_14_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_14_init() {
    auto result = this->gen_01_delay_14_calcSizeInSamples();
    this->gen_01_delay_14__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_14_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_14_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_14_clear() {
    this->gen_01_delay_14_buffer->setZero();
}

void gen_01_delay_14_reset() {
    auto result = this->gen_01_delay_14_calcSizeInSamples();
    this->gen_01_delay_14__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_14_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_14_buffer);
    this->gen_01_delay_14_wrap = this->gen_01_delay_14_buffer->getSize() - 1;
    this->gen_01_delay_14_clear();

    if (this->gen_01_delay_14_reader >= this->gen_01_delay_14__maxdelay || this->gen_01_delay_14_writer >= this->gen_01_delay_14__maxdelay) {
        this->gen_01_delay_14_reader = 0;
        this->gen_01_delay_14_writer = 0;
    }
}

void gen_01_delay_14_dspsetup() {
    this->gen_01_delay_14_reset();
}

number gen_01_delay_14_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 10;
}

number gen_01_delay_14_size() {
    return this->gen_01_delay_14__maxdelay;
}

void gen_01_delay_15_step() {
    this->gen_01_delay_15_reader++;

    if (this->gen_01_delay_15_reader >= (Int)(this->gen_01_delay_15_buffer->getSize()))
        this->gen_01_delay_15_reader = 0;
}

number gen_01_delay_15_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_15_buffer->getSize()) + this->gen_01_delay_15_reader - ((size > this->gen_01_delay_15__maxdelay ? this->gen_01_delay_15__maxdelay : (size < (this->gen_01_delay_15_reader != this->gen_01_delay_15_writer) ? this->gen_01_delay_15_reader != this->gen_01_delay_15_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_15_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_15_wrap))
        ), this->gen_01_delay_15_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_15_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_15_buffer->getSize()) + this->gen_01_delay_15_reader - ((size > this->gen_01_delay_15__maxdelay ? this->gen_01_delay_15__maxdelay : (size < (this->gen_01_delay_15_reader != this->gen_01_delay_15_writer) ? this->gen_01_delay_15_reader != this->gen_01_delay_15_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_15_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_15_wrap))
    );
}

void gen_01_delay_15_write(number v) {
    this->gen_01_delay_15_writer = this->gen_01_delay_15_reader;
    this->gen_01_delay_15_buffer[(Index)this->gen_01_delay_15_writer] = v;
}

number gen_01_delay_15_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_15__maxdelay : size);
    number val = this->gen_01_delay_15_read(effectiveSize, 0);
    this->gen_01_delay_15_write(v);
    this->gen_01_delay_15_step();
    return val;
}

array<Index, 2> gen_01_delay_15_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_15_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_15_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_15_init() {
    auto result = this->gen_01_delay_15_calcSizeInSamples();
    this->gen_01_delay_15__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_15_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_15_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_15_clear() {
    this->gen_01_delay_15_buffer->setZero();
}

void gen_01_delay_15_reset() {
    auto result = this->gen_01_delay_15_calcSizeInSamples();
    this->gen_01_delay_15__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_15_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_15_buffer);
    this->gen_01_delay_15_wrap = this->gen_01_delay_15_buffer->getSize() - 1;
    this->gen_01_delay_15_clear();

    if (this->gen_01_delay_15_reader >= this->gen_01_delay_15__maxdelay || this->gen_01_delay_15_writer >= this->gen_01_delay_15__maxdelay) {
        this->gen_01_delay_15_reader = 0;
        this->gen_01_delay_15_writer = 0;
    }
}

void gen_01_delay_15_dspsetup() {
    this->gen_01_delay_15_reset();
}

number gen_01_delay_15_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 6;
}

number gen_01_delay_15_size() {
    return this->gen_01_delay_15__maxdelay;
}

void gen_01_delay_16_step() {
    this->gen_01_delay_16_reader++;

    if (this->gen_01_delay_16_reader >= (Int)(this->gen_01_delay_16_buffer->getSize()))
        this->gen_01_delay_16_reader = 0;
}

number gen_01_delay_16_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_16_buffer->getSize()) + this->gen_01_delay_16_reader - ((size > this->gen_01_delay_16__maxdelay ? this->gen_01_delay_16__maxdelay : (size < (this->gen_01_delay_16_reader != this->gen_01_delay_16_writer) ? this->gen_01_delay_16_reader != this->gen_01_delay_16_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_16_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_16_wrap))
        ), this->gen_01_delay_16_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_16_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_16_buffer->getSize()) + this->gen_01_delay_16_reader - ((size > this->gen_01_delay_16__maxdelay ? this->gen_01_delay_16__maxdelay : (size < (this->gen_01_delay_16_reader != this->gen_01_delay_16_writer) ? this->gen_01_delay_16_reader != this->gen_01_delay_16_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_16_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_16_wrap))
    );
}

void gen_01_delay_16_write(number v) {
    this->gen_01_delay_16_writer = this->gen_01_delay_16_reader;
    this->gen_01_delay_16_buffer[(Index)this->gen_01_delay_16_writer] = v;
}

number gen_01_delay_16_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_16__maxdelay : size);
    number val = this->gen_01_delay_16_read(effectiveSize, 0);
    this->gen_01_delay_16_write(v);
    this->gen_01_delay_16_step();
    return val;
}

array<Index, 2> gen_01_delay_16_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_16_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_16_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_16_init() {
    auto result = this->gen_01_delay_16_calcSizeInSamples();
    this->gen_01_delay_16__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_16_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_16_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_16_clear() {
    this->gen_01_delay_16_buffer->setZero();
}

void gen_01_delay_16_reset() {
    auto result = this->gen_01_delay_16_calcSizeInSamples();
    this->gen_01_delay_16__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_16_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_16_buffer);
    this->gen_01_delay_16_wrap = this->gen_01_delay_16_buffer->getSize() - 1;
    this->gen_01_delay_16_clear();

    if (this->gen_01_delay_16_reader >= this->gen_01_delay_16__maxdelay || this->gen_01_delay_16_writer >= this->gen_01_delay_16__maxdelay) {
        this->gen_01_delay_16_reader = 0;
        this->gen_01_delay_16_writer = 0;
    }
}

void gen_01_delay_16_dspsetup() {
    this->gen_01_delay_16_reset();
}

number gen_01_delay_16_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 6;
}

number gen_01_delay_16_size() {
    return this->gen_01_delay_16__maxdelay;
}

void gen_01_delay_17_step() {
    this->gen_01_delay_17_reader++;

    if (this->gen_01_delay_17_reader >= (Int)(this->gen_01_delay_17_buffer->getSize()))
        this->gen_01_delay_17_reader = 0;
}

number gen_01_delay_17_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_17_buffer->getSize()) + this->gen_01_delay_17_reader - ((size > this->gen_01_delay_17__maxdelay ? this->gen_01_delay_17__maxdelay : (size < (this->gen_01_delay_17_reader != this->gen_01_delay_17_writer) ? this->gen_01_delay_17_reader != this->gen_01_delay_17_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_17_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_17_wrap))
        ), this->gen_01_delay_17_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_17_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_17_buffer->getSize()) + this->gen_01_delay_17_reader - ((size > this->gen_01_delay_17__maxdelay ? this->gen_01_delay_17__maxdelay : (size < (this->gen_01_delay_17_reader != this->gen_01_delay_17_writer) ? this->gen_01_delay_17_reader != this->gen_01_delay_17_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_17_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_17_wrap))
    );
}

void gen_01_delay_17_write(number v) {
    this->gen_01_delay_17_writer = this->gen_01_delay_17_reader;
    this->gen_01_delay_17_buffer[(Index)this->gen_01_delay_17_writer] = v;
}

number gen_01_delay_17_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_17__maxdelay : size);
    number val = this->gen_01_delay_17_read(effectiveSize, 0);
    this->gen_01_delay_17_write(v);
    this->gen_01_delay_17_step();
    return val;
}

array<Index, 2> gen_01_delay_17_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_17_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_17_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_17_init() {
    auto result = this->gen_01_delay_17_calcSizeInSamples();
    this->gen_01_delay_17__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_17_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_17_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_17_clear() {
    this->gen_01_delay_17_buffer->setZero();
}

void gen_01_delay_17_reset() {
    auto result = this->gen_01_delay_17_calcSizeInSamples();
    this->gen_01_delay_17__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_17_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_17_buffer);
    this->gen_01_delay_17_wrap = this->gen_01_delay_17_buffer->getSize() - 1;
    this->gen_01_delay_17_clear();

    if (this->gen_01_delay_17_reader >= this->gen_01_delay_17__maxdelay || this->gen_01_delay_17_writer >= this->gen_01_delay_17__maxdelay) {
        this->gen_01_delay_17_reader = 0;
        this->gen_01_delay_17_writer = 0;
    }
}

void gen_01_delay_17_dspsetup() {
    this->gen_01_delay_17_reset();
}

number gen_01_delay_17_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 5;
}

number gen_01_delay_17_size() {
    return this->gen_01_delay_17__maxdelay;
}

void gen_01_delay_18_step() {
    this->gen_01_delay_18_reader++;

    if (this->gen_01_delay_18_reader >= (Int)(this->gen_01_delay_18_buffer->getSize()))
        this->gen_01_delay_18_reader = 0;
}

number gen_01_delay_18_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_18_buffer->getSize()) + this->gen_01_delay_18_reader - ((size > this->gen_01_delay_18__maxdelay ? this->gen_01_delay_18__maxdelay : (size < (this->gen_01_delay_18_reader != this->gen_01_delay_18_writer) ? this->gen_01_delay_18_reader != this->gen_01_delay_18_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_18_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_18_wrap))
        ), this->gen_01_delay_18_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_18_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_18_buffer->getSize()) + this->gen_01_delay_18_reader - ((size > this->gen_01_delay_18__maxdelay ? this->gen_01_delay_18__maxdelay : (size < (this->gen_01_delay_18_reader != this->gen_01_delay_18_writer) ? this->gen_01_delay_18_reader != this->gen_01_delay_18_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_18_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_18_wrap))
    );
}

void gen_01_delay_18_write(number v) {
    this->gen_01_delay_18_writer = this->gen_01_delay_18_reader;
    this->gen_01_delay_18_buffer[(Index)this->gen_01_delay_18_writer] = v;
}

number gen_01_delay_18_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_18__maxdelay : size);
    number val = this->gen_01_delay_18_read(effectiveSize, 0);
    this->gen_01_delay_18_write(v);
    this->gen_01_delay_18_step();
    return val;
}

array<Index, 2> gen_01_delay_18_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_18_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_18_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_18_init() {
    auto result = this->gen_01_delay_18_calcSizeInSamples();
    this->gen_01_delay_18__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_18_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_18_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_18_clear() {
    this->gen_01_delay_18_buffer->setZero();
}

void gen_01_delay_18_reset() {
    auto result = this->gen_01_delay_18_calcSizeInSamples();
    this->gen_01_delay_18__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_18_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_18_buffer);
    this->gen_01_delay_18_wrap = this->gen_01_delay_18_buffer->getSize() - 1;
    this->gen_01_delay_18_clear();

    if (this->gen_01_delay_18_reader >= this->gen_01_delay_18__maxdelay || this->gen_01_delay_18_writer >= this->gen_01_delay_18__maxdelay) {
        this->gen_01_delay_18_reader = 0;
        this->gen_01_delay_18_writer = 0;
    }
}

void gen_01_delay_18_dspsetup() {
    this->gen_01_delay_18_reset();
}

number gen_01_delay_18_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 5;
}

number gen_01_delay_18_size() {
    return this->gen_01_delay_18__maxdelay;
}

void gen_01_delay_19_step() {
    this->gen_01_delay_19_reader++;

    if (this->gen_01_delay_19_reader >= (Int)(this->gen_01_delay_19_buffer->getSize()))
        this->gen_01_delay_19_reader = 0;
}

number gen_01_delay_19_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_19_buffer->getSize()) + this->gen_01_delay_19_reader - ((size > this->gen_01_delay_19__maxdelay ? this->gen_01_delay_19__maxdelay : (size < (this->gen_01_delay_19_reader != this->gen_01_delay_19_writer) ? this->gen_01_delay_19_reader != this->gen_01_delay_19_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_19_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_19_wrap))
        ), this->gen_01_delay_19_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_19_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_19_buffer->getSize()) + this->gen_01_delay_19_reader - ((size > this->gen_01_delay_19__maxdelay ? this->gen_01_delay_19__maxdelay : (size < (this->gen_01_delay_19_reader != this->gen_01_delay_19_writer) ? this->gen_01_delay_19_reader != this->gen_01_delay_19_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_19_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_19_wrap))
    );
}

void gen_01_delay_19_write(number v) {
    this->gen_01_delay_19_writer = this->gen_01_delay_19_reader;
    this->gen_01_delay_19_buffer[(Index)this->gen_01_delay_19_writer] = v;
}

number gen_01_delay_19_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_19__maxdelay : size);
    number val = this->gen_01_delay_19_read(effectiveSize, 0);
    this->gen_01_delay_19_write(v);
    this->gen_01_delay_19_step();
    return val;
}

array<Index, 2> gen_01_delay_19_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_19_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_19_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_19_init() {
    auto result = this->gen_01_delay_19_calcSizeInSamples();
    this->gen_01_delay_19__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_19_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_19_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_19_clear() {
    this->gen_01_delay_19_buffer->setZero();
}

void gen_01_delay_19_reset() {
    auto result = this->gen_01_delay_19_calcSizeInSamples();
    this->gen_01_delay_19__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_19_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_19_buffer);
    this->gen_01_delay_19_wrap = this->gen_01_delay_19_buffer->getSize() - 1;
    this->gen_01_delay_19_clear();

    if (this->gen_01_delay_19_reader >= this->gen_01_delay_19__maxdelay || this->gen_01_delay_19_writer >= this->gen_01_delay_19__maxdelay) {
        this->gen_01_delay_19_reader = 0;
        this->gen_01_delay_19_writer = 0;
    }
}

void gen_01_delay_19_dspsetup() {
    this->gen_01_delay_19_reset();
}

number gen_01_delay_19_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 3;
}

number gen_01_delay_19_size() {
    return this->gen_01_delay_19__maxdelay;
}

void gen_01_delay_20_step() {
    this->gen_01_delay_20_reader++;

    if (this->gen_01_delay_20_reader >= (Int)(this->gen_01_delay_20_buffer->getSize()))
        this->gen_01_delay_20_reader = 0;
}

number gen_01_delay_20_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_20_buffer->getSize()) + this->gen_01_delay_20_reader - ((size > this->gen_01_delay_20__maxdelay ? this->gen_01_delay_20__maxdelay : (size < (this->gen_01_delay_20_reader != this->gen_01_delay_20_writer) ? this->gen_01_delay_20_reader != this->gen_01_delay_20_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_20_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_20_wrap))
        ), this->gen_01_delay_20_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_20_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_20_buffer->getSize()) + this->gen_01_delay_20_reader - ((size > this->gen_01_delay_20__maxdelay ? this->gen_01_delay_20__maxdelay : (size < (this->gen_01_delay_20_reader != this->gen_01_delay_20_writer) ? this->gen_01_delay_20_reader != this->gen_01_delay_20_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_20_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_20_wrap))
    );
}

void gen_01_delay_20_write(number v) {
    this->gen_01_delay_20_writer = this->gen_01_delay_20_reader;
    this->gen_01_delay_20_buffer[(Index)this->gen_01_delay_20_writer] = v;
}

number gen_01_delay_20_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_20__maxdelay : size);
    number val = this->gen_01_delay_20_read(effectiveSize, 0);
    this->gen_01_delay_20_write(v);
    this->gen_01_delay_20_step();
    return val;
}

array<Index, 2> gen_01_delay_20_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_20_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_20_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_20_init() {
    auto result = this->gen_01_delay_20_calcSizeInSamples();
    this->gen_01_delay_20__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_20_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_20_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_20_clear() {
    this->gen_01_delay_20_buffer->setZero();
}

void gen_01_delay_20_reset() {
    auto result = this->gen_01_delay_20_calcSizeInSamples();
    this->gen_01_delay_20__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_20_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_20_buffer);
    this->gen_01_delay_20_wrap = this->gen_01_delay_20_buffer->getSize() - 1;
    this->gen_01_delay_20_clear();

    if (this->gen_01_delay_20_reader >= this->gen_01_delay_20__maxdelay || this->gen_01_delay_20_writer >= this->gen_01_delay_20__maxdelay) {
        this->gen_01_delay_20_reader = 0;
        this->gen_01_delay_20_writer = 0;
    }
}

void gen_01_delay_20_dspsetup() {
    this->gen_01_delay_20_reset();
}

number gen_01_delay_20_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_20_size() {
    return this->gen_01_delay_20__maxdelay;
}

void gen_01_delay_21_step() {
    this->gen_01_delay_21_reader++;

    if (this->gen_01_delay_21_reader >= (Int)(this->gen_01_delay_21_buffer->getSize()))
        this->gen_01_delay_21_reader = 0;
}

number gen_01_delay_21_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_21_buffer->getSize()) + this->gen_01_delay_21_reader - ((size > this->gen_01_delay_21__maxdelay ? this->gen_01_delay_21__maxdelay : (size < (this->gen_01_delay_21_reader != this->gen_01_delay_21_writer) ? this->gen_01_delay_21_reader != this->gen_01_delay_21_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_21_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_21_wrap))
        ), this->gen_01_delay_21_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_21_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_21_buffer->getSize()) + this->gen_01_delay_21_reader - ((size > this->gen_01_delay_21__maxdelay ? this->gen_01_delay_21__maxdelay : (size < (this->gen_01_delay_21_reader != this->gen_01_delay_21_writer) ? this->gen_01_delay_21_reader != this->gen_01_delay_21_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_21_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_21_wrap))
    );
}

void gen_01_delay_21_write(number v) {
    this->gen_01_delay_21_writer = this->gen_01_delay_21_reader;
    this->gen_01_delay_21_buffer[(Index)this->gen_01_delay_21_writer] = v;
}

number gen_01_delay_21_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_21__maxdelay : size);
    number val = this->gen_01_delay_21_read(effectiveSize, 0);
    this->gen_01_delay_21_write(v);
    this->gen_01_delay_21_step();
    return val;
}

array<Index, 2> gen_01_delay_21_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_21_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_21_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_21_init() {
    auto result = this->gen_01_delay_21_calcSizeInSamples();
    this->gen_01_delay_21__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_21_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_21_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_21_clear() {
    this->gen_01_delay_21_buffer->setZero();
}

void gen_01_delay_21_reset() {
    auto result = this->gen_01_delay_21_calcSizeInSamples();
    this->gen_01_delay_21__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_21_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_21_buffer);
    this->gen_01_delay_21_wrap = this->gen_01_delay_21_buffer->getSize() - 1;
    this->gen_01_delay_21_clear();

    if (this->gen_01_delay_21_reader >= this->gen_01_delay_21__maxdelay || this->gen_01_delay_21_writer >= this->gen_01_delay_21__maxdelay) {
        this->gen_01_delay_21_reader = 0;
        this->gen_01_delay_21_writer = 0;
    }
}

void gen_01_delay_21_dspsetup() {
    this->gen_01_delay_21_reset();
}

number gen_01_delay_21_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 15;
}

number gen_01_delay_21_size() {
    return this->gen_01_delay_21__maxdelay;
}

void gen_01_delay_22_step() {
    this->gen_01_delay_22_reader++;

    if (this->gen_01_delay_22_reader >= (Int)(this->gen_01_delay_22_buffer->getSize()))
        this->gen_01_delay_22_reader = 0;
}

number gen_01_delay_22_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_22_buffer->getSize()) + this->gen_01_delay_22_reader - ((size > this->gen_01_delay_22__maxdelay ? this->gen_01_delay_22__maxdelay : (size < (this->gen_01_delay_22_reader != this->gen_01_delay_22_writer) ? this->gen_01_delay_22_reader != this->gen_01_delay_22_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_22_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_22_wrap))
        ), this->gen_01_delay_22_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_22_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_22_buffer->getSize()) + this->gen_01_delay_22_reader - ((size > this->gen_01_delay_22__maxdelay ? this->gen_01_delay_22__maxdelay : (size < (this->gen_01_delay_22_reader != this->gen_01_delay_22_writer) ? this->gen_01_delay_22_reader != this->gen_01_delay_22_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_22_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_22_wrap))
    );
}

void gen_01_delay_22_write(number v) {
    this->gen_01_delay_22_writer = this->gen_01_delay_22_reader;
    this->gen_01_delay_22_buffer[(Index)this->gen_01_delay_22_writer] = v;
}

number gen_01_delay_22_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_22__maxdelay : size);
    number val = this->gen_01_delay_22_read(effectiveSize, 0);
    this->gen_01_delay_22_write(v);
    this->gen_01_delay_22_step();
    return val;
}

array<Index, 2> gen_01_delay_22_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_22_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_22_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_22_init() {
    auto result = this->gen_01_delay_22_calcSizeInSamples();
    this->gen_01_delay_22__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_22_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_22_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_22_clear() {
    this->gen_01_delay_22_buffer->setZero();
}

void gen_01_delay_22_reset() {
    auto result = this->gen_01_delay_22_calcSizeInSamples();
    this->gen_01_delay_22__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_22_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_22_buffer);
    this->gen_01_delay_22_wrap = this->gen_01_delay_22_buffer->getSize() - 1;
    this->gen_01_delay_22_clear();

    if (this->gen_01_delay_22_reader >= this->gen_01_delay_22__maxdelay || this->gen_01_delay_22_writer >= this->gen_01_delay_22__maxdelay) {
        this->gen_01_delay_22_reader = 0;
        this->gen_01_delay_22_writer = 0;
    }
}

void gen_01_delay_22_dspsetup() {
    this->gen_01_delay_22_reset();
}

number gen_01_delay_22_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 3;
}

number gen_01_delay_22_size() {
    return this->gen_01_delay_22__maxdelay;
}

void gen_01_delay_23_step() {
    this->gen_01_delay_23_reader++;

    if (this->gen_01_delay_23_reader >= (Int)(this->gen_01_delay_23_buffer->getSize()))
        this->gen_01_delay_23_reader = 0;
}

number gen_01_delay_23_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_23_buffer->getSize()) + this->gen_01_delay_23_reader - ((size > this->gen_01_delay_23__maxdelay ? this->gen_01_delay_23__maxdelay : (size < (this->gen_01_delay_23_reader != this->gen_01_delay_23_writer) ? this->gen_01_delay_23_reader != this->gen_01_delay_23_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_23_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_23_wrap))
        ), this->gen_01_delay_23_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_23_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_23_buffer->getSize()) + this->gen_01_delay_23_reader - ((size > this->gen_01_delay_23__maxdelay ? this->gen_01_delay_23__maxdelay : (size < (this->gen_01_delay_23_reader != this->gen_01_delay_23_writer) ? this->gen_01_delay_23_reader != this->gen_01_delay_23_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_23_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_23_wrap))
    );
}

void gen_01_delay_23_write(number v) {
    this->gen_01_delay_23_writer = this->gen_01_delay_23_reader;
    this->gen_01_delay_23_buffer[(Index)this->gen_01_delay_23_writer] = v;
}

number gen_01_delay_23_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_23__maxdelay : size);
    number val = this->gen_01_delay_23_read(effectiveSize, 0);
    this->gen_01_delay_23_write(v);
    this->gen_01_delay_23_step();
    return val;
}

array<Index, 2> gen_01_delay_23_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_23_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_23_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_23_init() {
    auto result = this->gen_01_delay_23_calcSizeInSamples();
    this->gen_01_delay_23__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_23_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_23_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_23_clear() {
    this->gen_01_delay_23_buffer->setZero();
}

void gen_01_delay_23_reset() {
    auto result = this->gen_01_delay_23_calcSizeInSamples();
    this->gen_01_delay_23__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_23_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_23_buffer);
    this->gen_01_delay_23_wrap = this->gen_01_delay_23_buffer->getSize() - 1;
    this->gen_01_delay_23_clear();

    if (this->gen_01_delay_23_reader >= this->gen_01_delay_23__maxdelay || this->gen_01_delay_23_writer >= this->gen_01_delay_23__maxdelay) {
        this->gen_01_delay_23_reader = 0;
        this->gen_01_delay_23_writer = 0;
    }
}

void gen_01_delay_23_dspsetup() {
    this->gen_01_delay_23_reset();
}

number gen_01_delay_23_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 10;
}

number gen_01_delay_23_size() {
    return this->gen_01_delay_23__maxdelay;
}

void gen_01_delay_24_step() {
    this->gen_01_delay_24_reader++;

    if (this->gen_01_delay_24_reader >= (Int)(this->gen_01_delay_24_buffer->getSize()))
        this->gen_01_delay_24_reader = 0;
}

number gen_01_delay_24_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_24_buffer->getSize()) + this->gen_01_delay_24_reader - ((size > this->gen_01_delay_24__maxdelay ? this->gen_01_delay_24__maxdelay : (size < (this->gen_01_delay_24_reader != this->gen_01_delay_24_writer) ? this->gen_01_delay_24_reader != this->gen_01_delay_24_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_24_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_24_wrap))
        ), this->gen_01_delay_24_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_24_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_24_buffer->getSize()) + this->gen_01_delay_24_reader - ((size > this->gen_01_delay_24__maxdelay ? this->gen_01_delay_24__maxdelay : (size < (this->gen_01_delay_24_reader != this->gen_01_delay_24_writer) ? this->gen_01_delay_24_reader != this->gen_01_delay_24_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_24_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_24_wrap))
    );
}

void gen_01_delay_24_write(number v) {
    this->gen_01_delay_24_writer = this->gen_01_delay_24_reader;
    this->gen_01_delay_24_buffer[(Index)this->gen_01_delay_24_writer] = v;
}

number gen_01_delay_24_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_24__maxdelay : size);
    number val = this->gen_01_delay_24_read(effectiveSize, 0);
    this->gen_01_delay_24_write(v);
    this->gen_01_delay_24_step();
    return val;
}

array<Index, 2> gen_01_delay_24_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_24_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_24_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_24_init() {
    auto result = this->gen_01_delay_24_calcSizeInSamples();
    this->gen_01_delay_24__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_24_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_24_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_24_clear() {
    this->gen_01_delay_24_buffer->setZero();
}

void gen_01_delay_24_reset() {
    auto result = this->gen_01_delay_24_calcSizeInSamples();
    this->gen_01_delay_24__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_24_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_24_buffer);
    this->gen_01_delay_24_wrap = this->gen_01_delay_24_buffer->getSize() - 1;
    this->gen_01_delay_24_clear();

    if (this->gen_01_delay_24_reader >= this->gen_01_delay_24__maxdelay || this->gen_01_delay_24_writer >= this->gen_01_delay_24__maxdelay) {
        this->gen_01_delay_24_reader = 0;
        this->gen_01_delay_24_writer = 0;
    }
}

void gen_01_delay_24_dspsetup() {
    this->gen_01_delay_24_reset();
}

number gen_01_delay_24_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr * 10;
}

number gen_01_delay_24_size() {
    return this->gen_01_delay_24__maxdelay;
}

void gen_01_delay_25_step() {
    this->gen_01_delay_25_reader++;

    if (this->gen_01_delay_25_reader >= (Int)(this->gen_01_delay_25_buffer->getSize()))
        this->gen_01_delay_25_reader = 0;
}

number gen_01_delay_25_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_25_buffer->getSize()) + this->gen_01_delay_25_reader - ((size > this->gen_01_delay_25__maxdelay ? this->gen_01_delay_25__maxdelay : (size < (this->gen_01_delay_25_reader != this->gen_01_delay_25_writer) ? this->gen_01_delay_25_reader != this->gen_01_delay_25_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_25_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_25_wrap))
        ), this->gen_01_delay_25_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_25_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_25_buffer->getSize()) + this->gen_01_delay_25_reader - ((size > this->gen_01_delay_25__maxdelay ? this->gen_01_delay_25__maxdelay : (size < (this->gen_01_delay_25_reader != this->gen_01_delay_25_writer) ? this->gen_01_delay_25_reader != this->gen_01_delay_25_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_25_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_25_wrap))
    );
}

void gen_01_delay_25_write(number v) {
    this->gen_01_delay_25_writer = this->gen_01_delay_25_reader;
    this->gen_01_delay_25_buffer[(Index)this->gen_01_delay_25_writer] = v;
}

number gen_01_delay_25_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_25__maxdelay : size);
    number val = this->gen_01_delay_25_read(effectiveSize, 0);
    this->gen_01_delay_25_write(v);
    this->gen_01_delay_25_step();
    return val;
}

array<Index, 2> gen_01_delay_25_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_25_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_25_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_25_init() {
    auto result = this->gen_01_delay_25_calcSizeInSamples();
    this->gen_01_delay_25__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_25_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_25_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_25_clear() {
    this->gen_01_delay_25_buffer->setZero();
}

void gen_01_delay_25_reset() {
    auto result = this->gen_01_delay_25_calcSizeInSamples();
    this->gen_01_delay_25__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_25_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_25_buffer);
    this->gen_01_delay_25_wrap = this->gen_01_delay_25_buffer->getSize() - 1;
    this->gen_01_delay_25_clear();

    if (this->gen_01_delay_25_reader >= this->gen_01_delay_25__maxdelay || this->gen_01_delay_25_writer >= this->gen_01_delay_25__maxdelay) {
        this->gen_01_delay_25_reader = 0;
        this->gen_01_delay_25_writer = 0;
    }
}

void gen_01_delay_25_dspsetup() {
    this->gen_01_delay_25_reset();
}

number gen_01_delay_25_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr;
}

number gen_01_delay_25_size() {
    return this->gen_01_delay_25__maxdelay;
}

void gen_01_delay_26_step() {
    this->gen_01_delay_26_reader++;

    if (this->gen_01_delay_26_reader >= (Int)(this->gen_01_delay_26_buffer->getSize()))
        this->gen_01_delay_26_reader = 0;
}

number gen_01_delay_26_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_26_buffer->getSize()) + this->gen_01_delay_26_reader - ((size > this->gen_01_delay_26__maxdelay ? this->gen_01_delay_26__maxdelay : (size < (this->gen_01_delay_26_reader != this->gen_01_delay_26_writer) ? this->gen_01_delay_26_reader != this->gen_01_delay_26_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_26_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_26_wrap))
        ), this->gen_01_delay_26_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_26_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_26_buffer->getSize()) + this->gen_01_delay_26_reader - ((size > this->gen_01_delay_26__maxdelay ? this->gen_01_delay_26__maxdelay : (size < (this->gen_01_delay_26_reader != this->gen_01_delay_26_writer) ? this->gen_01_delay_26_reader != this->gen_01_delay_26_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_26_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_26_wrap))
    );
}

void gen_01_delay_26_write(number v) {
    this->gen_01_delay_26_writer = this->gen_01_delay_26_reader;
    this->gen_01_delay_26_buffer[(Index)this->gen_01_delay_26_writer] = v;
}

number gen_01_delay_26_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_26__maxdelay : size);
    number val = this->gen_01_delay_26_read(effectiveSize, 0);
    this->gen_01_delay_26_write(v);
    this->gen_01_delay_26_step();
    return val;
}

array<Index, 2> gen_01_delay_26_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_26_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_26_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_26_init() {
    auto result = this->gen_01_delay_26_calcSizeInSamples();
    this->gen_01_delay_26__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_26_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_26_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_26_clear() {
    this->gen_01_delay_26_buffer->setZero();
}

void gen_01_delay_26_reset() {
    auto result = this->gen_01_delay_26_calcSizeInSamples();
    this->gen_01_delay_26__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_26_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_26_buffer);
    this->gen_01_delay_26_wrap = this->gen_01_delay_26_buffer->getSize() - 1;
    this->gen_01_delay_26_clear();

    if (this->gen_01_delay_26_reader >= this->gen_01_delay_26__maxdelay || this->gen_01_delay_26_writer >= this->gen_01_delay_26__maxdelay) {
        this->gen_01_delay_26_reader = 0;
        this->gen_01_delay_26_writer = 0;
    }
}

void gen_01_delay_26_dspsetup() {
    this->gen_01_delay_26_reset();
}

number gen_01_delay_26_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr;
}

number gen_01_delay_26_size() {
    return this->gen_01_delay_26__maxdelay;
}

void gen_01_delay_27_step() {
    this->gen_01_delay_27_reader++;

    if (this->gen_01_delay_27_reader >= (Int)(this->gen_01_delay_27_buffer->getSize()))
        this->gen_01_delay_27_reader = 0;
}

number gen_01_delay_27_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_27_buffer->getSize()) + this->gen_01_delay_27_reader - ((size > this->gen_01_delay_27__maxdelay ? this->gen_01_delay_27__maxdelay : (size < (this->gen_01_delay_27_reader != this->gen_01_delay_27_writer) ? this->gen_01_delay_27_reader != this->gen_01_delay_27_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_27_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_27_wrap))
        ), this->gen_01_delay_27_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_27_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_27_buffer->getSize()) + this->gen_01_delay_27_reader - ((size > this->gen_01_delay_27__maxdelay ? this->gen_01_delay_27__maxdelay : (size < (this->gen_01_delay_27_reader != this->gen_01_delay_27_writer) ? this->gen_01_delay_27_reader != this->gen_01_delay_27_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_27_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_27_wrap))
    );
}

void gen_01_delay_27_write(number v) {
    this->gen_01_delay_27_writer = this->gen_01_delay_27_reader;
    this->gen_01_delay_27_buffer[(Index)this->gen_01_delay_27_writer] = v;
}

number gen_01_delay_27_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_27__maxdelay : size);
    number val = this->gen_01_delay_27_read(effectiveSize, 0);
    this->gen_01_delay_27_write(v);
    this->gen_01_delay_27_step();
    return val;
}

array<Index, 2> gen_01_delay_27_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_27_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_27_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_27_init() {
    auto result = this->gen_01_delay_27_calcSizeInSamples();
    this->gen_01_delay_27__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_27_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_27_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_27_clear() {
    this->gen_01_delay_27_buffer->setZero();
}

void gen_01_delay_27_reset() {
    auto result = this->gen_01_delay_27_calcSizeInSamples();
    this->gen_01_delay_27__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_27_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_27_buffer);
    this->gen_01_delay_27_wrap = this->gen_01_delay_27_buffer->getSize() - 1;
    this->gen_01_delay_27_clear();

    if (this->gen_01_delay_27_reader >= this->gen_01_delay_27__maxdelay || this->gen_01_delay_27_writer >= this->gen_01_delay_27__maxdelay) {
        this->gen_01_delay_27_reader = 0;
        this->gen_01_delay_27_writer = 0;
    }
}

void gen_01_delay_27_dspsetup() {
    this->gen_01_delay_27_reset();
}

number gen_01_delay_27_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr;
}

number gen_01_delay_27_size() {
    return this->gen_01_delay_27__maxdelay;
}

void gen_01_delay_28_step() {
    this->gen_01_delay_28_reader++;

    if (this->gen_01_delay_28_reader >= (Int)(this->gen_01_delay_28_buffer->getSize()))
        this->gen_01_delay_28_reader = 0;
}

number gen_01_delay_28_read(number size, Int interp) {
    RNBO_UNUSED(interp);

    {
        number r = (Int)(this->gen_01_delay_28_buffer->getSize()) + this->gen_01_delay_28_reader - ((size > this->gen_01_delay_28__maxdelay ? this->gen_01_delay_28__maxdelay : (size < (this->gen_01_delay_28_reader != this->gen_01_delay_28_writer) ? this->gen_01_delay_28_reader != this->gen_01_delay_28_writer : size)));
        Int index1 = (Int)(rnbo_floor(r));
        number frac = r - index1;
        Int index2 = (Int)(index1 + 1);

        return this->linearinterp(frac, this->gen_01_delay_28_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_28_wrap))
        ), this->gen_01_delay_28_buffer->getSample(
            0,
            (Index)((BinOpInt)((BinOpInt)index2 & (BinOpInt)this->gen_01_delay_28_wrap))
        ));
    }

    number r = (Int)(this->gen_01_delay_28_buffer->getSize()) + this->gen_01_delay_28_reader - ((size > this->gen_01_delay_28__maxdelay ? this->gen_01_delay_28__maxdelay : (size < (this->gen_01_delay_28_reader != this->gen_01_delay_28_writer) ? this->gen_01_delay_28_reader != this->gen_01_delay_28_writer : size)));
    Int index1 = (Int)(rnbo_floor(r));

    return this->gen_01_delay_28_buffer->getSample(
        0,
        (Index)((BinOpInt)((BinOpInt)index1 & (BinOpInt)this->gen_01_delay_28_wrap))
    );
}

void gen_01_delay_28_write(number v) {
    this->gen_01_delay_28_writer = this->gen_01_delay_28_reader;
    this->gen_01_delay_28_buffer[(Index)this->gen_01_delay_28_writer] = v;
}

number gen_01_delay_28_next(number v, Int size) {
    number effectiveSize = (size == -1 ? this->gen_01_delay_28__maxdelay : size);
    number val = this->gen_01_delay_28_read(effectiveSize, 0);
    this->gen_01_delay_28_write(v);
    this->gen_01_delay_28_step();
    return val;
}

array<Index, 2> gen_01_delay_28_calcSizeInSamples() {
    number sizeInSamples = 0;
    Index allocatedSizeInSamples = 0;

    {
        sizeInSamples = this->gen_01_delay_28_evaluateSizeExpr(this->sr, this->vs);
        this->gen_01_delay_28_sizemode = 0;
    }

    sizeInSamples = rnbo_floor(sizeInSamples);
    sizeInSamples = this->maximum(sizeInSamples, 2);
    allocatedSizeInSamples = (Index)(sizeInSamples);
    allocatedSizeInSamples = nextpoweroftwo(allocatedSizeInSamples);
    return {sizeInSamples, allocatedSizeInSamples};
}

void gen_01_delay_28_init() {
    auto result = this->gen_01_delay_28_calcSizeInSamples();
    this->gen_01_delay_28__maxdelay = result[0];
    Index requestedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_28_buffer->requestSize(requestedSizeInSamples, 1);
    this->gen_01_delay_28_wrap = requestedSizeInSamples - 1;
}

void gen_01_delay_28_clear() {
    this->gen_01_delay_28_buffer->setZero();
}

void gen_01_delay_28_reset() {
    auto result = this->gen_01_delay_28_calcSizeInSamples();
    this->gen_01_delay_28__maxdelay = result[0];
    Index allocatedSizeInSamples = (Index)(result[1]);
    this->gen_01_delay_28_buffer->setSize(allocatedSizeInSamples);
    updateDataRef(this, this->gen_01_delay_28_buffer);
    this->gen_01_delay_28_wrap = this->gen_01_delay_28_buffer->getSize() - 1;
    this->gen_01_delay_28_clear();

    if (this->gen_01_delay_28_reader >= this->gen_01_delay_28__maxdelay || this->gen_01_delay_28_writer >= this->gen_01_delay_28__maxdelay) {
        this->gen_01_delay_28_reader = 0;
        this->gen_01_delay_28_writer = 0;
    }
}

void gen_01_delay_28_dspsetup() {
    this->gen_01_delay_28_reset();
}

number gen_01_delay_28_evaluateSizeExpr(number samplerate, number vectorsize) {
    RNBO_UNUSED(vectorsize);
    RNBO_UNUSED(samplerate);
    return this->sr;
}

number gen_01_delay_28_size() {
    return this->gen_01_delay_28__maxdelay;
}

number gen_01_history_29_getvalue() {
    return this->gen_01_history_29_value;
}

void gen_01_history_29_setvalue(number val) {
    this->gen_01_history_29_value = val;
}

void gen_01_history_29_reset() {
    this->gen_01_history_29_value = 0;
}

void gen_01_history_29_init() {
    this->gen_01_history_29_value = 0;
}

number gen_01_history_30_getvalue() {
    return this->gen_01_history_30_value;
}

void gen_01_history_30_setvalue(number val) {
    this->gen_01_history_30_value = val;
}

void gen_01_history_30_reset() {
    this->gen_01_history_30_value = 0;
}

void gen_01_history_30_init() {
    this->gen_01_history_30_value = 0;
}

number gen_01_history_31_getvalue() {
    return this->gen_01_history_31_value;
}

void gen_01_history_31_setvalue(number val) {
    this->gen_01_history_31_value = val;
}

void gen_01_history_31_reset() {
    this->gen_01_history_31_value = 0;
}

void gen_01_history_31_init() {
    this->gen_01_history_31_value = 0;
}

number gen_01_history_32_getvalue() {
    return this->gen_01_history_32_value;
}

void gen_01_history_32_setvalue(number val) {
    this->gen_01_history_32_value = val;
}

void gen_01_history_32_reset() {
    this->gen_01_history_32_value = 0;
}

void gen_01_history_32_init() {
    this->gen_01_history_32_value = 0;
}

number gen_01_history_33_getvalue() {
    return this->gen_01_history_33_value;
}

void gen_01_history_33_setvalue(number val) {
    this->gen_01_history_33_value = val;
}

void gen_01_history_33_reset() {
    this->gen_01_history_33_value = 0;
}

void gen_01_history_33_init() {
    this->gen_01_history_33_value = 0;
}

number gen_01_history_34_getvalue() {
    return this->gen_01_history_34_value;
}

void gen_01_history_34_setvalue(number val) {
    this->gen_01_history_34_value = val;
}

void gen_01_history_34_reset() {
    this->gen_01_history_34_value = 0;
}

void gen_01_history_34_init() {
    this->gen_01_history_34_value = 0;
}

number gen_01_history_35_getvalue() {
    return this->gen_01_history_35_value;
}

void gen_01_history_35_setvalue(number val) {
    this->gen_01_history_35_value = val;
}

void gen_01_history_35_reset() {
    this->gen_01_history_35_value = 0;
}

void gen_01_history_35_init() {
    this->gen_01_history_35_value = 0;
}

number gen_01_history_36_getvalue() {
    return this->gen_01_history_36_value;
}

void gen_01_history_36_setvalue(number val) {
    this->gen_01_history_36_value = val;
}

void gen_01_history_36_reset() {
    this->gen_01_history_36_value = 0;
}

void gen_01_history_36_init() {
    this->gen_01_history_36_value = 0;
}

array<number, 3> gen_01_counter_17_next(number a, number reset, number limit) {
    RNBO_UNUSED(reset);
    number carry_flag = 0;

    {
        this->gen_01_counter_17_count += a;

        if (limit != 0) {
            if ((a > 0 && this->gen_01_counter_17_count >= limit) || (a < 0 && this->gen_01_counter_17_count <= limit)) {
                this->gen_01_counter_17_count = 0;
                this->gen_01_counter_17_carry += 1;
                carry_flag = 1;
            }
        }
    }

    return {this->gen_01_counter_17_count, carry_flag, this->gen_01_counter_17_carry};
}

void gen_01_counter_17_init() {
    this->gen_01_counter_17_count = 0;
}

void gen_01_counter_17_reset() {
    this->gen_01_counter_17_carry = 0;
    this->gen_01_counter_17_count = 0;
}

number gen_01_latch_20_next(number x, number control) {
    if (control != 0.) {
        this->gen_01_latch_20_value = x;
    }

    return this->gen_01_latch_20_value;
}

void gen_01_latch_20_dspsetup() {
    this->gen_01_latch_20_reset();
}

void gen_01_latch_20_init() {
    this->gen_01_latch_20_reset();
}

void gen_01_latch_20_reset() {
    this->gen_01_latch_20_value = 0;
}

number gen_01_latch_25_next(number x, number control) {
    if (control != 0.) {
        this->gen_01_latch_25_value = x;
    }

    return this->gen_01_latch_25_value;
}

void gen_01_latch_25_dspsetup() {
    this->gen_01_latch_25_reset();
}

void gen_01_latch_25_init() {
    this->gen_01_latch_25_reset();
}

void gen_01_latch_25_reset() {
    this->gen_01_latch_25_value = 0;
}

number gen_01_cycle_233_ph_next(number freq, number reset) {
    RNBO_UNUSED(reset);

    {
        {}
    }

    number pincr = freq * this->gen_01_cycle_233_ph_conv;

    if (this->gen_01_cycle_233_ph_currentPhase < 0.)
        this->gen_01_cycle_233_ph_currentPhase = 1. + this->gen_01_cycle_233_ph_currentPhase;

    if (this->gen_01_cycle_233_ph_currentPhase > 1.)
        this->gen_01_cycle_233_ph_currentPhase = this->gen_01_cycle_233_ph_currentPhase - 1.;

    number tmp = this->gen_01_cycle_233_ph_currentPhase;
    this->gen_01_cycle_233_ph_currentPhase += pincr;
    return tmp;
}

void gen_01_cycle_233_ph_reset() {
    this->gen_01_cycle_233_ph_currentPhase = 0;
}

void gen_01_cycle_233_ph_dspsetup() {
    this->gen_01_cycle_233_ph_conv = (this->sr == 0. ? 0. : (number)1 / this->sr);
}

array<number, 2> gen_01_cycle_233_next(number frequency, number phase_offset) {
    RNBO_UNUSED(phase_offset);

    {
        UInt32 uint_phase;

        {
            uint_phase = this->gen_01_cycle_233_phasei;
        }

        UInt32 idx = (UInt32)(uint32_rshift(uint_phase, 18));
        number frac = ((BinOpInt)((BinOpInt)uint_phase & (BinOpInt)262143)) * 3.81471181759574e-6;
        number y0 = this->gen_01_cycle_233_buffer[(Index)idx];
        number y1 = this->gen_01_cycle_233_buffer[(Index)((BinOpInt)(idx + 1) & (BinOpInt)16383)];
        number y = y0 + frac * (y1 - y0);

        {
            UInt32 pincr = (UInt32)(uint32_trunc(frequency * this->gen_01_cycle_233_f2i));
            this->gen_01_cycle_233_phasei = uint32_add(this->gen_01_cycle_233_phasei, pincr);
        }

        return {y, uint_phase * 0.232830643653869629e-9};
    }
}

void gen_01_cycle_233_dspsetup() {
    this->gen_01_cycle_233_phasei = 0;
    this->gen_01_cycle_233_f2i = (this->sr == 0. ? 0. : (number)4294967296 / this->sr);
    this->gen_01_cycle_233_wrap = (Int)(this->gen_01_cycle_233_buffer->getSize()) - 1;
}

void gen_01_cycle_233_reset() {
    this->gen_01_cycle_233_phasei = 0;
}

void gen_01_cycle_233_bufferUpdated() {
    this->gen_01_cycle_233_wrap = (Int)(this->gen_01_cycle_233_buffer->getSize()) - 1;
}

number gen_01_cycle_241_ph_next(number freq, number reset) {
    RNBO_UNUSED(reset);

    {
        {}
    }

    number pincr = freq * this->gen_01_cycle_241_ph_conv;

    if (this->gen_01_cycle_241_ph_currentPhase < 0.)
        this->gen_01_cycle_241_ph_currentPhase = 1. + this->gen_01_cycle_241_ph_currentPhase;

    if (this->gen_01_cycle_241_ph_currentPhase > 1.)
        this->gen_01_cycle_241_ph_currentPhase = this->gen_01_cycle_241_ph_currentPhase - 1.;

    number tmp = this->gen_01_cycle_241_ph_currentPhase;
    this->gen_01_cycle_241_ph_currentPhase += pincr;
    return tmp;
}

void gen_01_cycle_241_ph_reset() {
    this->gen_01_cycle_241_ph_currentPhase = 0;
}

void gen_01_cycle_241_ph_dspsetup() {
    this->gen_01_cycle_241_ph_conv = (this->sr == 0. ? 0. : (number)1 / this->sr);
}

array<number, 2> gen_01_cycle_241_next(number frequency, number phase_offset) {
    RNBO_UNUSED(phase_offset);

    {
        UInt32 uint_phase;

        {
            uint_phase = this->gen_01_cycle_241_phasei;
        }

        UInt32 idx = (UInt32)(uint32_rshift(uint_phase, 18));
        number frac = ((BinOpInt)((BinOpInt)uint_phase & (BinOpInt)262143)) * 3.81471181759574e-6;
        number y0 = this->gen_01_cycle_241_buffer[(Index)idx];
        number y1 = this->gen_01_cycle_241_buffer[(Index)((BinOpInt)(idx + 1) & (BinOpInt)16383)];
        number y = y0 + frac * (y1 - y0);

        {
            UInt32 pincr = (UInt32)(uint32_trunc(frequency * this->gen_01_cycle_241_f2i));
            this->gen_01_cycle_241_phasei = uint32_add(this->gen_01_cycle_241_phasei, pincr);
        }

        return {y, uint_phase * 0.232830643653869629e-9};
    }
}

void gen_01_cycle_241_dspsetup() {
    this->gen_01_cycle_241_phasei = 0;
    this->gen_01_cycle_241_f2i = (this->sr == 0. ? 0. : (number)4294967296 / this->sr);
    this->gen_01_cycle_241_wrap = (Int)(this->gen_01_cycle_241_buffer->getSize()) - 1;
}

void gen_01_cycle_241_reset() {
    this->gen_01_cycle_241_phasei = 0;
}

void gen_01_cycle_241_bufferUpdated() {
    this->gen_01_cycle_241_wrap = (Int)(this->gen_01_cycle_241_buffer->getSize()) - 1;
}

number gen_01_cycle_249_ph_next(number freq, number reset) {
    RNBO_UNUSED(reset);

    {
        {}
    }

    number pincr = freq * this->gen_01_cycle_249_ph_conv;

    if (this->gen_01_cycle_249_ph_currentPhase < 0.)
        this->gen_01_cycle_249_ph_currentPhase = 1. + this->gen_01_cycle_249_ph_currentPhase;

    if (this->gen_01_cycle_249_ph_currentPhase > 1.)
        this->gen_01_cycle_249_ph_currentPhase = this->gen_01_cycle_249_ph_currentPhase - 1.;

    number tmp = this->gen_01_cycle_249_ph_currentPhase;
    this->gen_01_cycle_249_ph_currentPhase += pincr;
    return tmp;
}

void gen_01_cycle_249_ph_reset() {
    this->gen_01_cycle_249_ph_currentPhase = 0;
}

void gen_01_cycle_249_ph_dspsetup() {
    this->gen_01_cycle_249_ph_conv = (this->sr == 0. ? 0. : (number)1 / this->sr);
}

array<number, 2> gen_01_cycle_249_next(number frequency, number phase_offset) {
    RNBO_UNUSED(phase_offset);

    {
        UInt32 uint_phase;

        {
            uint_phase = this->gen_01_cycle_249_phasei;
        }

        UInt32 idx = (UInt32)(uint32_rshift(uint_phase, 18));
        number frac = ((BinOpInt)((BinOpInt)uint_phase & (BinOpInt)262143)) * 3.81471181759574e-6;
        number y0 = this->gen_01_cycle_249_buffer[(Index)idx];
        number y1 = this->gen_01_cycle_249_buffer[(Index)((BinOpInt)(idx + 1) & (BinOpInt)16383)];
        number y = y0 + frac * (y1 - y0);

        {
            UInt32 pincr = (UInt32)(uint32_trunc(frequency * this->gen_01_cycle_249_f2i));
            this->gen_01_cycle_249_phasei = uint32_add(this->gen_01_cycle_249_phasei, pincr);
        }

        return {y, uint_phase * 0.232830643653869629e-9};
    }
}

void gen_01_cycle_249_dspsetup() {
    this->gen_01_cycle_249_phasei = 0;
    this->gen_01_cycle_249_f2i = (this->sr == 0. ? 0. : (number)4294967296 / this->sr);
    this->gen_01_cycle_249_wrap = (Int)(this->gen_01_cycle_249_buffer->getSize()) - 1;
}

void gen_01_cycle_249_reset() {
    this->gen_01_cycle_249_phasei = 0;
}

void gen_01_cycle_249_bufferUpdated() {
    this->gen_01_cycle_249_wrap = (Int)(this->gen_01_cycle_249_buffer->getSize()) - 1;
}

number gen_01_cycle_257_ph_next(number freq, number reset) {
    RNBO_UNUSED(reset);

    {
        {}
    }

    number pincr = freq * this->gen_01_cycle_257_ph_conv;

    if (this->gen_01_cycle_257_ph_currentPhase < 0.)
        this->gen_01_cycle_257_ph_currentPhase = 1. + this->gen_01_cycle_257_ph_currentPhase;

    if (this->gen_01_cycle_257_ph_currentPhase > 1.)
        this->gen_01_cycle_257_ph_currentPhase = this->gen_01_cycle_257_ph_currentPhase - 1.;

    number tmp = this->gen_01_cycle_257_ph_currentPhase;
    this->gen_01_cycle_257_ph_currentPhase += pincr;
    return tmp;
}

void gen_01_cycle_257_ph_reset() {
    this->gen_01_cycle_257_ph_currentPhase = 0;
}

void gen_01_cycle_257_ph_dspsetup() {
    this->gen_01_cycle_257_ph_conv = (this->sr == 0. ? 0. : (number)1 / this->sr);
}

array<number, 2> gen_01_cycle_257_next(number frequency, number phase_offset) {
    RNBO_UNUSED(phase_offset);

    {
        UInt32 uint_phase;

        {
            uint_phase = this->gen_01_cycle_257_phasei;
        }

        UInt32 idx = (UInt32)(uint32_rshift(uint_phase, 18));
        number frac = ((BinOpInt)((BinOpInt)uint_phase & (BinOpInt)262143)) * 3.81471181759574e-6;
        number y0 = this->gen_01_cycle_257_buffer[(Index)idx];
        number y1 = this->gen_01_cycle_257_buffer[(Index)((BinOpInt)(idx + 1) & (BinOpInt)16383)];
        number y = y0 + frac * (y1 - y0);

        {
            UInt32 pincr = (UInt32)(uint32_trunc(frequency * this->gen_01_cycle_257_f2i));
            this->gen_01_cycle_257_phasei = uint32_add(this->gen_01_cycle_257_phasei, pincr);
        }

        return {y, uint_phase * 0.232830643653869629e-9};
    }
}

void gen_01_cycle_257_dspsetup() {
    this->gen_01_cycle_257_phasei = 0;
    this->gen_01_cycle_257_f2i = (this->sr == 0. ? 0. : (number)4294967296 / this->sr);
    this->gen_01_cycle_257_wrap = (Int)(this->gen_01_cycle_257_buffer->getSize()) - 1;
}

void gen_01_cycle_257_reset() {
    this->gen_01_cycle_257_phasei = 0;
}

void gen_01_cycle_257_bufferUpdated() {
    this->gen_01_cycle_257_wrap = (Int)(this->gen_01_cycle_257_buffer->getSize()) - 1;
}

number gen_01_latch_369_next(number x, number control) {
    if (control != 0.) {
        this->gen_01_latch_369_value = x;
    }

    return this->gen_01_latch_369_value;
}

void gen_01_latch_369_dspsetup() {
    this->gen_01_latch_369_reset();
}

void gen_01_latch_369_init() {
    this->gen_01_latch_369_reset();
}

void gen_01_latch_369_reset() {
    this->gen_01_latch_369_value = 0;
}

number gen_01_dcblock_371_next(number x, number gain) {
    RNBO_UNUSED(gain);
    number y = x - this->gen_01_dcblock_371_xm1 + this->gen_01_dcblock_371_ym1 * 0.9997;
    this->gen_01_dcblock_371_xm1 = x;
    this->gen_01_dcblock_371_ym1 = y;
    return y;
}

void gen_01_dcblock_371_reset() {
    this->gen_01_dcblock_371_xm1 = 0;
    this->gen_01_dcblock_371_ym1 = 0;
}

void gen_01_dcblock_371_dspsetup() {
    this->gen_01_dcblock_371_reset();
}

number gen_01_latch_400_next(number x, number control) {
    if (control != 0.) {
        this->gen_01_latch_400_value = x;
    }

    return this->gen_01_latch_400_value;
}

void gen_01_latch_400_dspsetup() {
    this->gen_01_latch_400_reset();
}

void gen_01_latch_400_init() {
    this->gen_01_latch_400_reset();
}

void gen_01_latch_400_reset() {
    this->gen_01_latch_400_value = 0;
}

number gen_01_dcblock_402_next(number x, number gain) {
    RNBO_UNUSED(gain);
    number y = x - this->gen_01_dcblock_402_xm1 + this->gen_01_dcblock_402_ym1 * 0.9997;
    this->gen_01_dcblock_402_xm1 = x;
    this->gen_01_dcblock_402_ym1 = y;
    return y;
}

void gen_01_dcblock_402_reset() {
    this->gen_01_dcblock_402_xm1 = 0;
    this->gen_01_dcblock_402_ym1 = 0;
}

void gen_01_dcblock_402_dspsetup() {
    this->gen_01_dcblock_402_reset();
}

void gen_01_dspsetup(bool force) {
    if ((bool)(this->gen_01_setupDone) && (bool)(!(bool)(force)))
        return;

    this->gen_01_setupDone = true;
    this->gen_01_delay_1_dspsetup();
    this->gen_01_delay_2_dspsetup();
    this->gen_01_delay_3_dspsetup();
    this->gen_01_delay_4_dspsetup();
    this->gen_01_delay_5_dspsetup();
    this->gen_01_delay_6_dspsetup();
    this->gen_01_delay_7_dspsetup();
    this->gen_01_delay_8_dspsetup();
    this->gen_01_delay_9_dspsetup();
    this->gen_01_delay_10_dspsetup();
    this->gen_01_delay_11_dspsetup();
    this->gen_01_delay_12_dspsetup();
    this->gen_01_delay_13_dspsetup();
    this->gen_01_delay_14_dspsetup();
    this->gen_01_delay_15_dspsetup();
    this->gen_01_delay_16_dspsetup();
    this->gen_01_delay_17_dspsetup();
    this->gen_01_delay_18_dspsetup();
    this->gen_01_delay_19_dspsetup();
    this->gen_01_delay_20_dspsetup();
    this->gen_01_delay_21_dspsetup();
    this->gen_01_delay_22_dspsetup();
    this->gen_01_delay_23_dspsetup();
    this->gen_01_delay_24_dspsetup();
    this->gen_01_delay_25_dspsetup();
    this->gen_01_delay_26_dspsetup();
    this->gen_01_delay_27_dspsetup();
    this->gen_01_delay_28_dspsetup();
    this->gen_01_latch_20_dspsetup();
    this->gen_01_latch_25_dspsetup();
    this->gen_01_cycle_233_ph_dspsetup();
    this->gen_01_cycle_233_dspsetup();
    this->gen_01_cycle_241_ph_dspsetup();
    this->gen_01_cycle_241_dspsetup();
    this->gen_01_cycle_249_ph_dspsetup();
    this->gen_01_cycle_249_dspsetup();
    this->gen_01_cycle_257_ph_dspsetup();
    this->gen_01_cycle_257_dspsetup();
    this->gen_01_latch_369_dspsetup();
    this->gen_01_dcblock_371_dspsetup();
    this->gen_01_latch_400_dspsetup();
    this->gen_01_dcblock_402_dspsetup();
}

void globaltransport_advance() {}

void globaltransport_dspsetup(bool ) {}

bool stackprotect_check() {
    this->stackprotect_count++;

    if (this->stackprotect_count > 128) {
        console->log("STACK OVERFLOW DETECTED - stopped processing branch !");
        return true;
    }

    return false;
}

Index getPatcherSerial() const {
    return 0;
}

void sendParameter(ParameterIndex index, bool ignoreValue) {
    this->getEngine()->notifyParameterValueChanged(index, (ignoreValue ? 0 : this->getParameterValue(index)), ignoreValue);
}

void scheduleParamInit(ParameterIndex index, Index order) {
    this->paramInitIndices->push(index);
    this->paramInitOrder->push(order);
}

void processParamInitEvents() {
    this->listquicksort(
        this->paramInitOrder,
        this->paramInitIndices,
        0,
        (int)(this->paramInitOrder->length - 1),
        true
    );

    for (Index i = 0; i < this->paramInitOrder->length; i++) {
        this->getEngine()->scheduleParameterBang(this->paramInitIndices[i], 0);
    }
}

void updateTime(MillisecondTime time, EXTERNALENGINE* engine, bool inProcess = false) {
    RNBO_UNUSED(inProcess);
    RNBO_UNUSED(engine);
    this->_currentTime = time;
    auto offset = rnbo_fround(this->msToSamps(time - this->getEngine()->getCurrentTime(), this->sr));

    if (offset >= (SampleIndex)(this->vs))
        offset = (SampleIndex)(this->vs) - 1;

    if (offset < 0)
        offset = 0;

    this->sampleOffsetIntoNextAudioBuffer = (Index)(offset);
}

void assign_defaults()
{
    expr_01_in1 = 0;
    expr_01_in2 = 1;
    expr_01_out1 = 0;
    expr_02_in1 = 0;
    expr_02_in2 = -1;
    expr_02_out1 = 0;
    linetilde_01_time = 20;
    linetilde_01_keepramp = true;
    param_01_value = 1;
    param_02_value = 0.6;
    param_03_value = 0.7;
    linetilde_02_time = 20;
    linetilde_02_keepramp = true;
    dspexpr_01_in1 = 0;
    dspexpr_01_in2 = 0;
    gen_01_in1 = 0;
    gen_01_in2 = 0;
    gen_01_decay = 0;
    gen_01_sample_rate_reduction = 0;
    dspexpr_02_in1 = 0;
    dspexpr_02_in2 = 0;
    dspexpr_03_in1 = 0;
    dspexpr_03_in2 = 0;
    dspexpr_04_in1 = 0;
    dspexpr_04_in2 = 0;
    _currentTime = 0;
    audioProcessSampleCount = 0;
    sampleOffsetIntoNextAudioBuffer = 0;
    zeroBuffer = nullptr;
    dummyBuffer = nullptr;
    signals[0] = nullptr;
    signals[1] = nullptr;
    signals[2] = nullptr;
    signals[3] = nullptr;
    signals[4] = nullptr;
    signals[5] = nullptr;
    didAllocateSignals = 0;
    vs = 0;
    maxvs = 0;
    sr = 44100;
    invsr = 0.000022675736961451248;
    linetilde_01_currentValue = 0;
    param_01_lastValue = 0;
    param_02_lastValue = 0;
    param_03_lastValue = 0;
    linetilde_02_currentValue = 0;
    gen_01_delay_1__maxdelay = 0;
    gen_01_delay_1_sizemode = 0;
    gen_01_delay_1_wrap = 0;
    gen_01_delay_1_reader = 0;
    gen_01_delay_1_writer = 0;
    gen_01_delay_2__maxdelay = 0;
    gen_01_delay_2_sizemode = 0;
    gen_01_delay_2_wrap = 0;
    gen_01_delay_2_reader = 0;
    gen_01_delay_2_writer = 0;
    gen_01_delay_3__maxdelay = 0;
    gen_01_delay_3_sizemode = 0;
    gen_01_delay_3_wrap = 0;
    gen_01_delay_3_reader = 0;
    gen_01_delay_3_writer = 0;
    gen_01_delay_4__maxdelay = 0;
    gen_01_delay_4_sizemode = 0;
    gen_01_delay_4_wrap = 0;
    gen_01_delay_4_reader = 0;
    gen_01_delay_4_writer = 0;
    gen_01_delay_5__maxdelay = 0;
    gen_01_delay_5_sizemode = 0;
    gen_01_delay_5_wrap = 0;
    gen_01_delay_5_reader = 0;
    gen_01_delay_5_writer = 0;
    gen_01_delay_6__maxdelay = 0;
    gen_01_delay_6_sizemode = 0;
    gen_01_delay_6_wrap = 0;
    gen_01_delay_6_reader = 0;
    gen_01_delay_6_writer = 0;
    gen_01_delay_7__maxdelay = 0;
    gen_01_delay_7_sizemode = 0;
    gen_01_delay_7_wrap = 0;
    gen_01_delay_7_reader = 0;
    gen_01_delay_7_writer = 0;
    gen_01_delay_8__maxdelay = 0;
    gen_01_delay_8_sizemode = 0;
    gen_01_delay_8_wrap = 0;
    gen_01_delay_8_reader = 0;
    gen_01_delay_8_writer = 0;
    gen_01_delay_9__maxdelay = 0;
    gen_01_delay_9_sizemode = 0;
    gen_01_delay_9_wrap = 0;
    gen_01_delay_9_reader = 0;
    gen_01_delay_9_writer = 0;
    gen_01_delay_10__maxdelay = 0;
    gen_01_delay_10_sizemode = 0;
    gen_01_delay_10_wrap = 0;
    gen_01_delay_10_reader = 0;
    gen_01_delay_10_writer = 0;
    gen_01_delay_11__maxdelay = 0;
    gen_01_delay_11_sizemode = 0;
    gen_01_delay_11_wrap = 0;
    gen_01_delay_11_reader = 0;
    gen_01_delay_11_writer = 0;
    gen_01_delay_12__maxdelay = 0;
    gen_01_delay_12_sizemode = 0;
    gen_01_delay_12_wrap = 0;
    gen_01_delay_12_reader = 0;
    gen_01_delay_12_writer = 0;
    gen_01_delay_13__maxdelay = 0;
    gen_01_delay_13_sizemode = 0;
    gen_01_delay_13_wrap = 0;
    gen_01_delay_13_reader = 0;
    gen_01_delay_13_writer = 0;
    gen_01_delay_14__maxdelay = 0;
    gen_01_delay_14_sizemode = 0;
    gen_01_delay_14_wrap = 0;
    gen_01_delay_14_reader = 0;
    gen_01_delay_14_writer = 0;
    gen_01_delay_15__maxdelay = 0;
    gen_01_delay_15_sizemode = 0;
    gen_01_delay_15_wrap = 0;
    gen_01_delay_15_reader = 0;
    gen_01_delay_15_writer = 0;
    gen_01_delay_16__maxdelay = 0;
    gen_01_delay_16_sizemode = 0;
    gen_01_delay_16_wrap = 0;
    gen_01_delay_16_reader = 0;
    gen_01_delay_16_writer = 0;
    gen_01_delay_17__maxdelay = 0;
    gen_01_delay_17_sizemode = 0;
    gen_01_delay_17_wrap = 0;
    gen_01_delay_17_reader = 0;
    gen_01_delay_17_writer = 0;
    gen_01_delay_18__maxdelay = 0;
    gen_01_delay_18_sizemode = 0;
    gen_01_delay_18_wrap = 0;
    gen_01_delay_18_reader = 0;
    gen_01_delay_18_writer = 0;
    gen_01_delay_19__maxdelay = 0;
    gen_01_delay_19_sizemode = 0;
    gen_01_delay_19_wrap = 0;
    gen_01_delay_19_reader = 0;
    gen_01_delay_19_writer = 0;
    gen_01_delay_20__maxdelay = 0;
    gen_01_delay_20_sizemode = 0;
    gen_01_delay_20_wrap = 0;
    gen_01_delay_20_reader = 0;
    gen_01_delay_20_writer = 0;
    gen_01_delay_21__maxdelay = 0;
    gen_01_delay_21_sizemode = 0;
    gen_01_delay_21_wrap = 0;
    gen_01_delay_21_reader = 0;
    gen_01_delay_21_writer = 0;
    gen_01_delay_22__maxdelay = 0;
    gen_01_delay_22_sizemode = 0;
    gen_01_delay_22_wrap = 0;
    gen_01_delay_22_reader = 0;
    gen_01_delay_22_writer = 0;
    gen_01_delay_23__maxdelay = 0;
    gen_01_delay_23_sizemode = 0;
    gen_01_delay_23_wrap = 0;
    gen_01_delay_23_reader = 0;
    gen_01_delay_23_writer = 0;
    gen_01_delay_24__maxdelay = 0;
    gen_01_delay_24_sizemode = 0;
    gen_01_delay_24_wrap = 0;
    gen_01_delay_24_reader = 0;
    gen_01_delay_24_writer = 0;
    gen_01_delay_25__maxdelay = 0;
    gen_01_delay_25_sizemode = 0;
    gen_01_delay_25_wrap = 0;
    gen_01_delay_25_reader = 0;
    gen_01_delay_25_writer = 0;
    gen_01_delay_26__maxdelay = 0;
    gen_01_delay_26_sizemode = 0;
    gen_01_delay_26_wrap = 0;
    gen_01_delay_26_reader = 0;
    gen_01_delay_26_writer = 0;
    gen_01_delay_27__maxdelay = 0;
    gen_01_delay_27_sizemode = 0;
    gen_01_delay_27_wrap = 0;
    gen_01_delay_27_reader = 0;
    gen_01_delay_27_writer = 0;
    gen_01_delay_28__maxdelay = 0;
    gen_01_delay_28_sizemode = 0;
    gen_01_delay_28_wrap = 0;
    gen_01_delay_28_reader = 0;
    gen_01_delay_28_writer = 0;
    gen_01_history_29_value = 0;
    gen_01_history_30_value = 0;
    gen_01_history_31_value = 0;
    gen_01_history_32_value = 0;
    gen_01_history_33_value = 0;
    gen_01_history_34_value = 0;
    gen_01_history_35_value = 0;
    gen_01_history_36_value = 0;
    gen_01_counter_17_carry = 0;
    gen_01_counter_17_count = 0;
    gen_01_latch_20_value = 0;
    gen_01_latch_25_value = 0;
    gen_01_cycle_233_ph_currentPhase = 0;
    gen_01_cycle_233_ph_conv = 0;
    gen_01_cycle_233_wrap = 0;
    gen_01_cycle_241_ph_currentPhase = 0;
    gen_01_cycle_241_ph_conv = 0;
    gen_01_cycle_241_wrap = 0;
    gen_01_cycle_249_ph_currentPhase = 0;
    gen_01_cycle_249_ph_conv = 0;
    gen_01_cycle_249_wrap = 0;
    gen_01_cycle_257_ph_currentPhase = 0;
    gen_01_cycle_257_ph_conv = 0;
    gen_01_cycle_257_wrap = 0;
    gen_01_latch_369_value = 0;
    gen_01_dcblock_371_xm1 = 0;
    gen_01_dcblock_371_ym1 = 0;
    gen_01_latch_400_value = 0;
    gen_01_dcblock_402_xm1 = 0;
    gen_01_dcblock_402_ym1 = 0;
    gen_01_setupDone = false;
    globaltransport_tempo = nullptr;
    globaltransport_state = nullptr;
    stackprotect_count = 0;
    _voiceIndex = 0;
    _noteNumber = 0;
    isMuted = 1;
}

    // data ref strings
    struct DataRefStrings {
    	static constexpr auto& name0 = "gen_01_delay_1_bufferobj";
    	static constexpr auto& file0 = "";
    	static constexpr auto& tag0 = "buffer~";
    	static constexpr auto& name1 = "gen_01_delay_2_bufferobj";
    	static constexpr auto& file1 = "";
    	static constexpr auto& tag1 = "buffer~";
    	static constexpr auto& name2 = "gen_01_delay_3_bufferobj";
    	static constexpr auto& file2 = "";
    	static constexpr auto& tag2 = "buffer~";
    	static constexpr auto& name3 = "gen_01_delay_4_bufferobj";
    	static constexpr auto& file3 = "";
    	static constexpr auto& tag3 = "buffer~";
    	static constexpr auto& name4 = "gen_01_delay_5_bufferobj";
    	static constexpr auto& file4 = "";
    	static constexpr auto& tag4 = "buffer~";
    	static constexpr auto& name5 = "gen_01_delay_6_bufferobj";
    	static constexpr auto& file5 = "";
    	static constexpr auto& tag5 = "buffer~";
    	static constexpr auto& name6 = "gen_01_delay_7_bufferobj";
    	static constexpr auto& file6 = "";
    	static constexpr auto& tag6 = "buffer~";
    	static constexpr auto& name7 = "gen_01_delay_8_bufferobj";
    	static constexpr auto& file7 = "";
    	static constexpr auto& tag7 = "buffer~";
    	static constexpr auto& name8 = "gen_01_delay_9_bufferobj";
    	static constexpr auto& file8 = "";
    	static constexpr auto& tag8 = "buffer~";
    	static constexpr auto& name9 = "gen_01_delay_10_bufferobj";
    	static constexpr auto& file9 = "";
    	static constexpr auto& tag9 = "buffer~";
    	static constexpr auto& name10 = "gen_01_delay_11_bufferobj";
    	static constexpr auto& file10 = "";
    	static constexpr auto& tag10 = "buffer~";
    	static constexpr auto& name11 = "gen_01_delay_12_bufferobj";
    	static constexpr auto& file11 = "";
    	static constexpr auto& tag11 = "buffer~";
    	static constexpr auto& name12 = "gen_01_delay_13_bufferobj";
    	static constexpr auto& file12 = "";
    	static constexpr auto& tag12 = "buffer~";
    	static constexpr auto& name13 = "gen_01_delay_14_bufferobj";
    	static constexpr auto& file13 = "";
    	static constexpr auto& tag13 = "buffer~";
    	static constexpr auto& name14 = "gen_01_delay_15_bufferobj";
    	static constexpr auto& file14 = "";
    	static constexpr auto& tag14 = "buffer~";
    	static constexpr auto& name15 = "gen_01_delay_16_bufferobj";
    	static constexpr auto& file15 = "";
    	static constexpr auto& tag15 = "buffer~";
    	static constexpr auto& name16 = "gen_01_delay_17_bufferobj";
    	static constexpr auto& file16 = "";
    	static constexpr auto& tag16 = "buffer~";
    	static constexpr auto& name17 = "gen_01_delay_18_bufferobj";
    	static constexpr auto& file17 = "";
    	static constexpr auto& tag17 = "buffer~";
    	static constexpr auto& name18 = "gen_01_delay_19_bufferobj";
    	static constexpr auto& file18 = "";
    	static constexpr auto& tag18 = "buffer~";
    	static constexpr auto& name19 = "gen_01_delay_20_bufferobj";
    	static constexpr auto& file19 = "";
    	static constexpr auto& tag19 = "buffer~";
    	static constexpr auto& name20 = "gen_01_delay_21_bufferobj";
    	static constexpr auto& file20 = "";
    	static constexpr auto& tag20 = "buffer~";
    	static constexpr auto& name21 = "gen_01_delay_22_bufferobj";
    	static constexpr auto& file21 = "";
    	static constexpr auto& tag21 = "buffer~";
    	static constexpr auto& name22 = "gen_01_delay_23_bufferobj";
    	static constexpr auto& file22 = "";
    	static constexpr auto& tag22 = "buffer~";
    	static constexpr auto& name23 = "gen_01_delay_24_bufferobj";
    	static constexpr auto& file23 = "";
    	static constexpr auto& tag23 = "buffer~";
    	static constexpr auto& name24 = "gen_01_delay_25_bufferobj";
    	static constexpr auto& file24 = "";
    	static constexpr auto& tag24 = "buffer~";
    	static constexpr auto& name25 = "gen_01_delay_26_bufferobj";
    	static constexpr auto& file25 = "";
    	static constexpr auto& tag25 = "buffer~";
    	static constexpr auto& name26 = "gen_01_delay_27_bufferobj";
    	static constexpr auto& file26 = "";
    	static constexpr auto& tag26 = "buffer~";
    	static constexpr auto& name27 = "gen_01_delay_28_bufferobj";
    	static constexpr auto& file27 = "";
    	static constexpr auto& tag27 = "buffer~";
    	static constexpr auto& name28 = "RNBODefaultSinus";
    	static constexpr auto& file28 = "";
    	static constexpr auto& tag28 = "buffer~";
    	DataRefStrings* operator->() { return this; }
    	const DataRefStrings* operator->() const { return this; }
    };

    DataRefStrings dataRefStrings;

// member variables

    number expr_01_in1;
    number expr_01_in2;
    number expr_01_out1;
    number expr_02_in1;
    number expr_02_in2;
    number expr_02_out1;
    list linetilde_01_segments;
    number linetilde_01_time;
    number linetilde_01_keepramp;
    number param_01_value;
    number param_02_value;
    number param_03_value;
    list linetilde_02_segments;
    number linetilde_02_time;
    number linetilde_02_keepramp;
    number dspexpr_01_in1;
    number dspexpr_01_in2;
    number gen_01_in1;
    number gen_01_in2;
    number gen_01_decay;
    number gen_01_sample_rate_reduction;
    number dspexpr_02_in1;
    number dspexpr_02_in2;
    number dspexpr_03_in1;
    number dspexpr_03_in2;
    number dspexpr_04_in1;
    number dspexpr_04_in2;
    MillisecondTime _currentTime;
    ENGINE _internalEngine;
    UInt64 audioProcessSampleCount;
    Index sampleOffsetIntoNextAudioBuffer;
    signal zeroBuffer;
    signal dummyBuffer;
    SampleValue * signals[6];
    bool didAllocateSignals;
    Index vs;
    Index maxvs;
    number sr;
    number invsr;
    list linetilde_01_activeRamps;
    number linetilde_01_currentValue;
    number param_01_lastValue;
    number param_02_lastValue;
    number param_03_lastValue;
    list linetilde_02_activeRamps;
    number linetilde_02_currentValue;
    Float64BufferRef gen_01_delay_1_buffer;
    Index gen_01_delay_1__maxdelay;
    Int gen_01_delay_1_sizemode;
    Index gen_01_delay_1_wrap;
    Int gen_01_delay_1_reader;
    Int gen_01_delay_1_writer;
    Float64BufferRef gen_01_delay_2_buffer;
    Index gen_01_delay_2__maxdelay;
    Int gen_01_delay_2_sizemode;
    Index gen_01_delay_2_wrap;
    Int gen_01_delay_2_reader;
    Int gen_01_delay_2_writer;
    Float64BufferRef gen_01_delay_3_buffer;
    Index gen_01_delay_3__maxdelay;
    Int gen_01_delay_3_sizemode;
    Index gen_01_delay_3_wrap;
    Int gen_01_delay_3_reader;
    Int gen_01_delay_3_writer;
    Float64BufferRef gen_01_delay_4_buffer;
    Index gen_01_delay_4__maxdelay;
    Int gen_01_delay_4_sizemode;
    Index gen_01_delay_4_wrap;
    Int gen_01_delay_4_reader;
    Int gen_01_delay_4_writer;
    Float64BufferRef gen_01_delay_5_buffer;
    Index gen_01_delay_5__maxdelay;
    Int gen_01_delay_5_sizemode;
    Index gen_01_delay_5_wrap;
    Int gen_01_delay_5_reader;
    Int gen_01_delay_5_writer;
    Float64BufferRef gen_01_delay_6_buffer;
    Index gen_01_delay_6__maxdelay;
    Int gen_01_delay_6_sizemode;
    Index gen_01_delay_6_wrap;
    Int gen_01_delay_6_reader;
    Int gen_01_delay_6_writer;
    Float64BufferRef gen_01_delay_7_buffer;
    Index gen_01_delay_7__maxdelay;
    Int gen_01_delay_7_sizemode;
    Index gen_01_delay_7_wrap;
    Int gen_01_delay_7_reader;
    Int gen_01_delay_7_writer;
    Float64BufferRef gen_01_delay_8_buffer;
    Index gen_01_delay_8__maxdelay;
    Int gen_01_delay_8_sizemode;
    Index gen_01_delay_8_wrap;
    Int gen_01_delay_8_reader;
    Int gen_01_delay_8_writer;
    Float64BufferRef gen_01_delay_9_buffer;
    Index gen_01_delay_9__maxdelay;
    Int gen_01_delay_9_sizemode;
    Index gen_01_delay_9_wrap;
    Int gen_01_delay_9_reader;
    Int gen_01_delay_9_writer;
    Float64BufferRef gen_01_delay_10_buffer;
    Index gen_01_delay_10__maxdelay;
    Int gen_01_delay_10_sizemode;
    Index gen_01_delay_10_wrap;
    Int gen_01_delay_10_reader;
    Int gen_01_delay_10_writer;
    Float64BufferRef gen_01_delay_11_buffer;
    Index gen_01_delay_11__maxdelay;
    Int gen_01_delay_11_sizemode;
    Index gen_01_delay_11_wrap;
    Int gen_01_delay_11_reader;
    Int gen_01_delay_11_writer;
    Float64BufferRef gen_01_delay_12_buffer;
    Index gen_01_delay_12__maxdelay;
    Int gen_01_delay_12_sizemode;
    Index gen_01_delay_12_wrap;
    Int gen_01_delay_12_reader;
    Int gen_01_delay_12_writer;
    Float64BufferRef gen_01_delay_13_buffer;
    Index gen_01_delay_13__maxdelay;
    Int gen_01_delay_13_sizemode;
    Index gen_01_delay_13_wrap;
    Int gen_01_delay_13_reader;
    Int gen_01_delay_13_writer;
    Float64BufferRef gen_01_delay_14_buffer;
    Index gen_01_delay_14__maxdelay;
    Int gen_01_delay_14_sizemode;
    Index gen_01_delay_14_wrap;
    Int gen_01_delay_14_reader;
    Int gen_01_delay_14_writer;
    Float64BufferRef gen_01_delay_15_buffer;
    Index gen_01_delay_15__maxdelay;
    Int gen_01_delay_15_sizemode;
    Index gen_01_delay_15_wrap;
    Int gen_01_delay_15_reader;
    Int gen_01_delay_15_writer;
    Float64BufferRef gen_01_delay_16_buffer;
    Index gen_01_delay_16__maxdelay;
    Int gen_01_delay_16_sizemode;
    Index gen_01_delay_16_wrap;
    Int gen_01_delay_16_reader;
    Int gen_01_delay_16_writer;
    Float64BufferRef gen_01_delay_17_buffer;
    Index gen_01_delay_17__maxdelay;
    Int gen_01_delay_17_sizemode;
    Index gen_01_delay_17_wrap;
    Int gen_01_delay_17_reader;
    Int gen_01_delay_17_writer;
    Float64BufferRef gen_01_delay_18_buffer;
    Index gen_01_delay_18__maxdelay;
    Int gen_01_delay_18_sizemode;
    Index gen_01_delay_18_wrap;
    Int gen_01_delay_18_reader;
    Int gen_01_delay_18_writer;
    Float64BufferRef gen_01_delay_19_buffer;
    Index gen_01_delay_19__maxdelay;
    Int gen_01_delay_19_sizemode;
    Index gen_01_delay_19_wrap;
    Int gen_01_delay_19_reader;
    Int gen_01_delay_19_writer;
    Float64BufferRef gen_01_delay_20_buffer;
    Index gen_01_delay_20__maxdelay;
    Int gen_01_delay_20_sizemode;
    Index gen_01_delay_20_wrap;
    Int gen_01_delay_20_reader;
    Int gen_01_delay_20_writer;
    Float64BufferRef gen_01_delay_21_buffer;
    Index gen_01_delay_21__maxdelay;
    Int gen_01_delay_21_sizemode;
    Index gen_01_delay_21_wrap;
    Int gen_01_delay_21_reader;
    Int gen_01_delay_21_writer;
    Float64BufferRef gen_01_delay_22_buffer;
    Index gen_01_delay_22__maxdelay;
    Int gen_01_delay_22_sizemode;
    Index gen_01_delay_22_wrap;
    Int gen_01_delay_22_reader;
    Int gen_01_delay_22_writer;
    Float64BufferRef gen_01_delay_23_buffer;
    Index gen_01_delay_23__maxdelay;
    Int gen_01_delay_23_sizemode;
    Index gen_01_delay_23_wrap;
    Int gen_01_delay_23_reader;
    Int gen_01_delay_23_writer;
    Float64BufferRef gen_01_delay_24_buffer;
    Index gen_01_delay_24__maxdelay;
    Int gen_01_delay_24_sizemode;
    Index gen_01_delay_24_wrap;
    Int gen_01_delay_24_reader;
    Int gen_01_delay_24_writer;
    Float64BufferRef gen_01_delay_25_buffer;
    Index gen_01_delay_25__maxdelay;
    Int gen_01_delay_25_sizemode;
    Index gen_01_delay_25_wrap;
    Int gen_01_delay_25_reader;
    Int gen_01_delay_25_writer;
    Float64BufferRef gen_01_delay_26_buffer;
    Index gen_01_delay_26__maxdelay;
    Int gen_01_delay_26_sizemode;
    Index gen_01_delay_26_wrap;
    Int gen_01_delay_26_reader;
    Int gen_01_delay_26_writer;
    Float64BufferRef gen_01_delay_27_buffer;
    Index gen_01_delay_27__maxdelay;
    Int gen_01_delay_27_sizemode;
    Index gen_01_delay_27_wrap;
    Int gen_01_delay_27_reader;
    Int gen_01_delay_27_writer;
    Float64BufferRef gen_01_delay_28_buffer;
    Index gen_01_delay_28__maxdelay;
    Int gen_01_delay_28_sizemode;
    Index gen_01_delay_28_wrap;
    Int gen_01_delay_28_reader;
    Int gen_01_delay_28_writer;
    number gen_01_history_29_value;
    number gen_01_history_30_value;
    number gen_01_history_31_value;
    number gen_01_history_32_value;
    number gen_01_history_33_value;
    number gen_01_history_34_value;
    number gen_01_history_35_value;
    number gen_01_history_36_value;
    Int gen_01_counter_17_carry;
    number gen_01_counter_17_count;
    number gen_01_latch_20_value;
    number gen_01_latch_25_value;
    number gen_01_cycle_233_ph_currentPhase;
    number gen_01_cycle_233_ph_conv;
    SampleBufferRef gen_01_cycle_233_buffer;
    Int gen_01_cycle_233_wrap;
    UInt32 gen_01_cycle_233_phasei;
    SampleValue gen_01_cycle_233_f2i;
    number gen_01_cycle_241_ph_currentPhase;
    number gen_01_cycle_241_ph_conv;
    SampleBufferRef gen_01_cycle_241_buffer;
    Int gen_01_cycle_241_wrap;
    UInt32 gen_01_cycle_241_phasei;
    SampleValue gen_01_cycle_241_f2i;
    number gen_01_cycle_249_ph_currentPhase;
    number gen_01_cycle_249_ph_conv;
    SampleBufferRef gen_01_cycle_249_buffer;
    Int gen_01_cycle_249_wrap;
    UInt32 gen_01_cycle_249_phasei;
    SampleValue gen_01_cycle_249_f2i;
    number gen_01_cycle_257_ph_currentPhase;
    number gen_01_cycle_257_ph_conv;
    SampleBufferRef gen_01_cycle_257_buffer;
    Int gen_01_cycle_257_wrap;
    UInt32 gen_01_cycle_257_phasei;
    SampleValue gen_01_cycle_257_f2i;
    number gen_01_latch_369_value;
    number gen_01_dcblock_371_xm1;
    number gen_01_dcblock_371_ym1;
    number gen_01_latch_400_value;
    number gen_01_dcblock_402_xm1;
    number gen_01_dcblock_402_ym1;
    bool gen_01_setupDone;
    signal globaltransport_tempo;
    signal globaltransport_state;
    number stackprotect_count;
    DataRef gen_01_delay_1_bufferobj;
    DataRef gen_01_delay_2_bufferobj;
    DataRef gen_01_delay_3_bufferobj;
    DataRef gen_01_delay_4_bufferobj;
    DataRef gen_01_delay_5_bufferobj;
    DataRef gen_01_delay_6_bufferobj;
    DataRef gen_01_delay_7_bufferobj;
    DataRef gen_01_delay_8_bufferobj;
    DataRef gen_01_delay_9_bufferobj;
    DataRef gen_01_delay_10_bufferobj;
    DataRef gen_01_delay_11_bufferobj;
    DataRef gen_01_delay_12_bufferobj;
    DataRef gen_01_delay_13_bufferobj;
    DataRef gen_01_delay_14_bufferobj;
    DataRef gen_01_delay_15_bufferobj;
    DataRef gen_01_delay_16_bufferobj;
    DataRef gen_01_delay_17_bufferobj;
    DataRef gen_01_delay_18_bufferobj;
    DataRef gen_01_delay_19_bufferobj;
    DataRef gen_01_delay_20_bufferobj;
    DataRef gen_01_delay_21_bufferobj;
    DataRef gen_01_delay_22_bufferobj;
    DataRef gen_01_delay_23_bufferobj;
    DataRef gen_01_delay_24_bufferobj;
    DataRef gen_01_delay_25_bufferobj;
    DataRef gen_01_delay_26_bufferobj;
    DataRef gen_01_delay_27_bufferobj;
    DataRef gen_01_delay_28_bufferobj;
    DataRef RNBODefaultSinus;
    Index _voiceIndex;
    Int _noteNumber;
    Index isMuted;
    indexlist paramInitIndices;
    indexlist paramInitOrder;
    bool _isInitialized = false;
};

static PatcherInterface* creaternbomatic()
{
    return new rnbomatic<EXTERNALENGINE>();
}

#ifndef RNBO_NO_PATCHERFACTORY
extern "C" PatcherFactoryFunctionPtr GetPatcherFactoryFunction()
#else
extern "C" PatcherFactoryFunctionPtr rnbomaticFactoryFunction()
#endif
{
    return creaternbomatic;
}

#ifndef RNBO_NO_PATCHERFACTORY
extern "C" void SetLogger(Logger* logger)
#else
void rnbomaticSetLogger(Logger* logger)
#endif
{
    console = logger;
}

} // end RNBO namespace

