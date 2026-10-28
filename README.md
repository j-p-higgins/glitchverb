# Glitch Verb
## Reclockable Reverb VST3/AU for Circuit Bent Ambience

![glitch verb ui](img/glitchverbscreenshot.png?raw=true)

Glitch Verb is a simple reverb plugin with a twist, adjusting the clock speed slows down the audio processing inside the reverb, sample reducing the input and output and extending the length of all delays and modulation sources used in the reverb algorithm. The result is a wash of aliasing sparkle and extremely long unnatural reverbs.

### Parameters
- Clock Speed: the sample rate of the internal processing, goes from the sample rate of your DAW or plugin host at 1 to 500hz at 0
- Decay: the amount of feedback in the reverb, the length of the actual reverb tail is determined by this and the clock speed
- Dry/Wet: the mix between the original signal and the reverb effect

Glitch Verb comes with a few presets to get you started however it is worth noting that these will sound different at different sample rates in your DAW and due to the non-linear nature of this process they sound very different with different input sounds.

## Download
Glitch Verb is available for Windows, Mac and Linux in VST3 and AU formats. The latest builds can be found in [Releases.](https://github.com/j-p-higgins/glitchverb/releases/latest)

## Technical Details
Glitch Verb was made in Max using RNBO and the front end was made using JUCE.

## Support
Free open-source audio tools like this are made possible by supporters on [Ko-Fi](https://ko-fi.com/jphiggins) and [YouTube Members.](https://www.youtube.com/channel/UCu6sS1xQcEqPCSRILJZFqDA/join)
