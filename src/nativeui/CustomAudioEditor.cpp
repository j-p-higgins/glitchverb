#include "CustomAudioEditor.h"
#include "UIColours.h"
#include "UIFonts.h"

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
        s->setSliderStyle (juce::Slider::LinearBar);
        s->setTextBoxStyle (juce::Slider::TextBoxBelow, true, 100, 50);
        s->setLookAndFeel (&mainSliderLookAndFeel);
        addAndMakeVisible (s);
    }

    auto setupLabel = [this] (Label& label, const char* text, const UIFonts::Style& style)
    {
        label.setText (text, dontSendNotification);
        label.setFont(style.font);
        label.setColour(Label::textColourId, style.colour);
        label.setJustificationType (style.justification);
        label.setBorderSize(style.border);
        addAndMakeVisible (label);
    };


    setupLabel(_mainLabel, "Glitch Verb", UIFonts::header());
    setupLabel (_clockSpeedLabel, "clock speed", UIFonts::parameter());
    setupLabel (_decayLabel, "decay", UIFonts::parameter());
    setupLabel (_dryWetLabel, "dry wet", UIFonts::parameter());

    setSize (350, 260);
}

CustomAudioEditor::~CustomAudioEditor() = default;

void CustomAudioEditor::paint (Graphics& g)
{
    g.fillAll (UIColours::background);
}

void CustomAudioEditor::resized()
{
    auto area = getLocalBounds().reduced (10);
    const int rowHeight = area.getHeight() / 7;
    _mainLabel.setBounds(area.removeFromTop(rowHeight));
	_clockSpeedLabel.setBounds(area.removeFromTop(rowHeight));
	_clockSpeedSlider.setBounds(area.removeFromTop(rowHeight));
	_decayLabel.setBounds(area.removeFromTop(rowHeight));
	_decaySlider.setBounds(area.removeFromTop(rowHeight));
	_dryWetLabel.setBounds(area.removeFromTop(rowHeight));
	_dryWetSlider.setBounds(area.removeFromTop(rowHeight));

}
