#include "CustomAudioEditor.h"

static juce::RangedAudioParameter&
findParameter(RNBO::JuceAudioProcessor* p, const juce::String& name)
{
    for (auto* param : p->getParameters())
    {
        if (param->getName(128) == name)
            return static_cast<juce::RangedAudioParameter&>(*param);
    }

    throw std::runtime_error("Parameter not found: " + name.toStdString());
}

CustomAudioEditor::CustomAudioEditor (RNBO::JuceAudioProcessor* const p,
                                      RNBO::CoreObject& rnboObject)
    : AudioProcessorEditor (p)
    , _audioProcessor (p)
    , _rnboObject (rnboObject)
    , _clockSpeedAttachment(findParameter(p, "clock_speed"), _clockSpeedSlider)
    , _decayAttachment(findParameter(p, "decay"), _decaySlider)
    , _dryWetAttachment(findParameter(p, "dry_wet"), _dryWetSlider)
{
    for (auto* s : { &_clockSpeedSlider, &_decaySlider, &_dryWetSlider })
    {
        s->setSliderStyle (Slider::LinearHorizontal);
        s->setTextBoxStyle (Slider::TextBoxRight, false, 60, 20);
        addAndMakeVisible (s);
    }

    auto setupLabel = [this] (Label& label, const char* text)
    {
        label.setText (text, dontSendNotification);
        label.setJustificationType (Justification::centredLeft);
        addAndMakeVisible (label);
    };

    setupLabel (_clockSpeedLabel, "Clock Speed");
    setupLabel (_decayLabel, "Decay");
    setupLabel (_dryWetLabel, "Dry/Wet");

    setSize (400, 160);
}

CustomAudioEditor::~CustomAudioEditor() = default;

void CustomAudioEditor::paint (Graphics& g)
{
    g.fillAll (getLookAndFeel().findColour (ResizableWindow::backgroundColourId));
}

void CustomAudioEditor::resized()
{
    auto area = getLocalBounds().reduced (16);
    const int rowHeight = area.getHeight() / 3;

    auto layoutRow = [&] (Label& label, Slider& slider)
    {
        auto row = area.removeFromTop (rowHeight);
        label.setBounds (row.removeFromLeft (60));
        slider.setBounds (row);
    };

    layoutRow (_clockSpeedLabel, _clockSpeedSlider);
    layoutRow (_decayLabel, _decaySlider);
    layoutRow (_dryWetLabel, _dryWetSlider);
}
