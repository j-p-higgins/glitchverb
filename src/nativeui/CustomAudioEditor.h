#pragma once

#include "JuceHeader.h"
#include "RNBO.h"
#include "RNBO_JuceAudioProcessor.h"
#include "MyColours.h"

class MainSliderLookAndFeel : public LookAndFeel_V4
{
public:
    void drawLinearSlider(Graphics& g, int x, int y, int width, int height, float sliderPos, float minSliderPos, float maxSliderPos, Slider::SliderStyle, Slider& slider)
    {
        Rectangle<int> sliderArea(x, y, width, height);

        g.setColour(MyColours::mainSlider);
        g.drawRect(sliderArea, 3); //draws outline for the slider

        if (slider.Slider::isVertical()) { //checks if slider is vertical and scales a rectangle to fill the slider area for horizontal or vertical sliders
            Rectangle<int> sliderFill(x, sliderPos + 3, width, height - sliderPos - 3);

            g.setColour(MyColours::mainSlider);
            g.fillRect(sliderFill);
        }
        else {
            Rectangle<int> sliderHorizontalFill(x, y, x + sliderPos - 3, height);

            g.setColour(MyColours::mainSlider);
            g.fillRect(sliderHorizontalFill);
        }
    }
    MainSliderLookAndFeel()
    {
        setColour(Slider::textBoxOutlineColourId, MyColours::transparent); //makes textbox outline transparent, probably a better way to do this
    }

    Slider::SliderLayout getSliderLayout(Slider& slider) override
    {
        if (slider.isVertical()) { //chops a chunk of the slider value box to move it out the centre of the slider
            Slider::SliderLayout layout;
            layout.sliderBounds = slider.getLocalBounds();
            layout.textBoxBounds = slider.getLocalBounds().withTrimmedTop(slider.getHeight() * 0.9);
            return layout;
        }
        else {
            Slider::SliderLayout layout;
            layout.sliderBounds = slider.getLocalBounds();
            layout.textBoxBounds = slider.getLocalBounds().withTrimmedLeft(slider.getWidth() * 0.85);
            return layout;
        }

    }


    Label* createSliderTextBox(Slider& slider) override
    {
        Label* l = LookAndFeel_V3::createSliderTextBox(slider);
        l->setColour(Label::textColourId, MyColours::accentText);
        l->setInterceptsMouseClicks(false, false);
        return l;
    }

};


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

    MainSliderLookAndFeel mainSliderLookAndFeel;

    // Sliders must be declared before attachments; SliderParameterAttachment
    // registers with the slider on construction.
    Slider _clockSpeedSlider, _decaySlider, _dryWetSlider;
    Label  _mainLabel,  _clockSpeedLabel,  _decayLabel,  _dryWetLabel;

    SliderParameterAttachment _clockSpeedAttachment;
    SliderParameterAttachment _decayAttachment;
    SliderParameterAttachment _dryWetAttachment;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (CustomAudioEditor)
};
