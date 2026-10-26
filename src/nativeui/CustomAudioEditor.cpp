#include "CustomAudioEditor.h"
#include "BinaryData.h"
#include "MyColours.h"

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
	auto majorMonoDisplayRegular = juce::Typeface::createSystemTypefaceFor(BinaryData::MajorMonoDisplayRegular_ttf, BinaryData::MajorMonoDisplayRegular_ttfSize);
	juce::LookAndFeel::getDefaultLookAndFeel().setDefaultSansSerifTypeface(majorMonoDisplayRegular);

    for (auto* s : { &_clockSpeedSlider, &_decaySlider, &_dryWetSlider })
    {
        s->setSliderStyle (juce::Slider::LinearBar);
        s->setTextBoxStyle (juce::Slider::TextBoxBelow, true, 100, 50);
        s->setLookAndFeel (&mainSliderLookAndFeel);
        addAndMakeVisible (s);
    }

    auto setupLabel = [this] (Label& label, const char* text)
    {
        label.setText (text, dontSendNotification);
        label.setJustificationType (Justification::bottomLeft);
        label.setFont(juce::Font(25.0f));
		label.setColour(Label::textColourId, MyColours::mainText);
        addAndMakeVisible (label);
    };

    auto setupHeader = [this](Label& label, const char* text)
        {
            label.setText(text, dontSendNotification);
            label.setJustificationType(Justification::centredRight);
            label.setFont(juce::Font(40.0f));
            label.setColour(Label::textColourId, MyColours::accentText);
            addAndMakeVisible(label);
        };

    setupHeader(_mainLabel, "Glitch Verb");
    setupLabel (_clockSpeedLabel, "clock speed");
    setupLabel (_decayLabel, "decay");
    setupLabel (_dryWetLabel, "dry wet");

    setSize (350, 260);
}

CustomAudioEditor::~CustomAudioEditor() = default;

void CustomAudioEditor::paint (Graphics& g)
{
    g.fillAll (MyColours::background);
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
