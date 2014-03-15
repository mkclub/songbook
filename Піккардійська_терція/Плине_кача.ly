\version "2.16.2"
\include "deutsch.ly"
\new Score {
  \new ChoirStaff <<
    \new Staff <<
      \clef "treble_8"
      \key d \minor
      \time 3/4
      \new Voice = "soprano" {
        \relative c' {
          \voiceOne
          d2.\pp~
          d2.~
          d2.~
          c2.~
          d2.

          d8\( e f4 e8 f
          g4 e c
          d2.~\)
          d2.
        }
      }
      \new Voice = "alto" {
        \relative c' {
          \voiceTwo
          d2.~
          d2.~
          d2.~
          c2.~
          d2.

          <b d>2.\(
          d4 c2
          d2.~\)
          d2.
        }
      }
    >>
    \new Lyrics {
      \lyricsto "soprano"
      \lyricmode { У... }
    }

    \new Staff <<
      \clef bass
      \key d \minor
      \time 3/4
      \new Voice = "tenor" {
        \relative c {
          \voiceOne
          R2.*2
          d8\( e f4 e8 f
          g2.
          a2.\)

          f2.\(
          g4 <e g>2
          a2.~\)
          a2.
        }
      }
      \new Voice = "bass" {
        \relative c {
          \voiceTwo
          R2.*2
          d8\( e f4 e8 f
          g4 e c
          d2.\)

          b2.\(
          c2.
          d2.~\)
          d2.
        }
      }
    >>
    \new Lyrics {
      \lyricsto "bass"
      \lyricmode { У... }
    }
  >>
}
