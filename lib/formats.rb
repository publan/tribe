# Given formats:
# Submission format Format code Bundles
# Image IMG 5 @ $450
#          10 @ $800
# Audio Flac 3 @ $427.50
#            6 @ $810
#            9 @ $1147.50
# Video VID 3 @ $570
#           5 @ $900
#           9 @ $1530

class Formats
  FORMATS = [
    img: [
      { count: 5, price: 450 },
      { count: 10, price: 800 }
    ],
    flac: [
      { count: 3, price: 427.50 },
      { count: 6, price: 810 },
      { count: 9, price: 1147.50 }
    ],
    vid: [
      { count: 3, price: 570 },
      { count: 5, price: 900 },
      { count: 9, price: 1530 }
    ]
  ]
end
