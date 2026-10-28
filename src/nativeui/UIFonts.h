#pragma once

#include "JuceHeader.h"
#include "BinaryData.h"
#include "UIColours.h"

namespace UIFonts
{
	inline juce::Typeface::Ptr getTypeface()
	{
		static auto typeface = juce::Typeface::createSystemTypefaceFor(BinaryData::MajorMonoDisplayRegular_ttf, BinaryData::MajorMonoDisplayRegular_ttfSize);

		return typeface;
	}

	struct Style
	{
		juce::Font font;
		juce::Justification justification;
		juce::BorderSize<int> border;
		juce::Colour colour;
	};

	inline Style header()
	{
		return { juce::Font(juce::FontOptions(30.0f).withTypeface(getTypeface())), juce::Justification::centredRight, juce::BorderSize<int>(0, 0, 0, 0), UIColours::accentText };
	}

	inline Style parameter()
	{
		return { juce::Font(juce::FontOptions(18.0f).withTypeface(getTypeface())), juce::Justification::bottomLeft, juce::BorderSize<int>(0, 0, 3, 0), UIColours::mainText };
	}

	inline Style sliderValue()
	{
		return { juce::Font(juce::FontOptions(15.0f).withTypeface(getTypeface())), juce::Justification::centred, juce::BorderSize<int>(1, 5, 1, 5), UIColours::accentText };
	}
}