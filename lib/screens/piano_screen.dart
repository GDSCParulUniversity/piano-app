import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PianoScreen extends StatelessWidget {
  const PianoScreen({Key? key}) : super(key: key);

  static AudioPlayer player = AudioPlayer();

  void playNode(fileName) {
    player.play(AssetSource(fileName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PianoButton(
            withBlackButton: false,
            onPressed: () => playNode('piano-b_B_major.wav'),
          ),
          PianoButton(
            onPressed: () => playNode('piano-a_A_major.wav'),
            onBlackButtonPressed: () => playNode('piano-bb_Ab_major.wav'),
          ),
          PianoButton(
            onPressed: () => playNode('piano-g_G_major.wav'),
            onBlackButtonPressed: () => playNode('piano-g_Gb_major.wav'),
          ),
          PianoButton(
            onPressed: () => playNode('piano-f_F_major.wav'),
            onBlackButtonPressed: () => playNode('piano-f_Fb_major.wav'),
          ),
          PianoButton(
            withBlackButton: false,
            onPressed: () => playNode('piano-e_E_major.wav'),
          ),
          PianoButton(
            onPressed: () => playNode('piano-d_D_major.wav'),
            onBlackButtonPressed: () => playNode('piano-eb_Db_major.wav'),
          ),
          PianoButton(
            onPressed: () => playNode('piano-c_C_major.wav'),
            onBlackButtonPressed: () => playNode('piano-c_Cb_major.wav'),
          ),
        ],
      ),
    );
  }
}

class PianoButton extends StatelessWidget {
  final bool withBlackButton;
  final Function()? onPressed;
  final Function()? onBlackButtonPressed;
  const PianoButton({
    super.key,
    this.withBlackButton = true,
    this.onPressed,
    this.onBlackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            margin: const EdgeInsets.only(top: 2, bottom: 2, right: 8),
            child: ElevatedButton(
              onPressed: onPressed,
              child: null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
          ),
          withBlackButton
              ? Positioned(
                  top: -25,
                  child: Container(
                    width: 250,
                    height: 50,
                    color: Colors.black,
                    child: ElevatedButton(
                      onPressed: onBlackButtonPressed,
                      child: null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
