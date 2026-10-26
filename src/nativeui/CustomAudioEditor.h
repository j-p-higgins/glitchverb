#pragma once

#include "JuceHeader.h"
#include "RNBO.h"
#include "RNBO_JuceAudioProcessor.h"

class CustomAudioEditor : public AudioProcessorEditor
{
public:
    CustomAudioEditor (RNBO::JuceAudioProcessor* const p, RNBO::CoreObject& rnboObject);
    ~CustomAudioEditor() override;
    void paint (Graphics& g) override;
    void resized() override;

private:
    RNBO::JuceAudioProcessor* _audioProcessor;
    RNBO::CoreObject&         _rnboObject;

    // Sliders must be declared before attachments; SliderParameterAttachment
    // registers with the slider on construction.
    Slider _clockSpeedSlider, _decaySlider, _dryWetSlider;
    Label  _mainLabel,  _clockSpeedLabel,  _decayLabel,  _dryWetLabel;

    SliderParameterAttachment _clockSpeedAttachment;
    SliderParameterAttachment _decayAttachment;
    SliderParameterAttachment _dryWetAttachment;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (CustomAudioEditor)
};
