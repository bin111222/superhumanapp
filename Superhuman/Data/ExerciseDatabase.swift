import Foundation

struct ExerciseDatabase {
    static let exercises: [Exercise] = [
        // WRISTS
        Exercise(
            name: "Wrist Flexor Stretch",
            bodyPart: .wrists,
            description: "Gentle stretch targeting the inner forearm muscles",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Extend your arm forward with palm facing up",
                "Use other hand to gently pull fingers down and back",
                "Hold for 30 seconds",
                "Repeat 3 times on each side"
            ],
            benefits: [
                "Improves wrist flexibility",
                "Reduces risk of carpal tunnel",
                "Relieves wrist tension"
            ]
        ),
        Exercise(
            name: "Wrist Rotations",
            bodyPart: .wrists,
            description: "Circular movements to improve mobility",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_57da25050e11456dbe4b5166408364f3/480p/mp4/file.mp4"),
            steps: [
                "Make a fist with both hands",
                "Rotate wrists in clockwise circles for 30 seconds",
                "Rotate wrists in counterclockwise circles for 30 seconds",
                "Repeat 3 sets"
            ],
            benefits: [
                "Increases range of motion",
                "Warms up wrist joints",
                "Prevents stiffness"
            ]
        ),
        Exercise(
            name: "Prayer Stretch",
            bodyPart: .wrists,
            description: "Stretching exercise for wrist flexors",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_bda9618a011c401483b84758eef5a6b7/360p/mp4/file.mp4"),
            steps: [
                "Place palms together in front of chest",
                "Lower hands toward waist while keeping palms together",
                "Hold for 30 seconds",
                "Repeat 3 times"
            ],
            benefits: [
                "Stretches wrist flexors",
                "Improves flexibility",
                "Reduces tension"
            ]
        ),
        Exercise(
            name: "Reverse Prayer Stretch",
            bodyPart: .wrists,
            description: "Advanced stretch for wrist extensors",
            difficulty: .intermediate,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Place backs of hands together at lower back",
                "Raise hands up gently to feel stretch",
                "Hold for 30 seconds",
                "Repeat 3 times"
            ],
            benefits: [
                "Stretches wrist extensors",
                "Improves flexibility",
                "Reduces tension"
            ]
        ),
        Exercise(
            name: "Wrist Extension",
            bodyPart: .wrists,
            description: "Strengthening exercise for wrist extensors",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Hold arm straight with palm facing down",
                "Lift hand upward, bending at wrist",
                "Hold for 5 seconds",
                "Perform 12 repetitions, 3 sets"
            ],
            benefits: [
                "Strengthens wrist extensors",
                "Improves grip strength",
                "Helps prevent tennis elbow"
            ]
        ),
        Exercise(
            name: "Radial/Ulnar Deviation",
            bodyPart: .wrists,
            description: "Side-to-side wrist movements",
            difficulty: .intermediate,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Rest forearm on table with hand over edge",
                "Move wrist side to side",
                "Perform 15 repetitions each direction",
                "Complete 3 sets"
            ],
            benefits: [
                "Improves lateral wrist mobility",
                "Strengthens stabilizer muscles",
                "Enhances wrist control"
            ]
        ),
        
        Exercise(
            name: "Wrist Pronation/Supination",
            bodyPart: .wrists,
            description: "Rotation exercise for forearm and wrist mobility",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Hold arm out straight with palm down",
                "Rotate forearm to turn palm up",
                "Alternate between palm down and up",
                "Perform 15 repetitions",
                "Complete 3 sets"
            ],
            benefits: [
                "Improves forearm rotation",
                "Enhances wrist flexibility",
                "Prevents repetitive strain"
            ]
        ),
        Exercise(
            name: "Tennis Ball Squeeze",
            bodyPart: .wrists,
            description: "Strengthening exercise for grip and wrist muscles",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Hold a tennis ball in hand",
                "Squeeze ball firmly",
                "Hold for 5 seconds",
                "Release slowly",
                "Repeat 15 times with each hand"
            ],
            benefits: [
                "Strengthens grip",
                "Improves hand endurance",
                "Reduces risk of repetitive strain"
            ]
        ),

        // NECK
        Exercise(
            name: "Head Tilts",
            bodyPart: .neck,
            description: "Side-to-side neck mobility exercise",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit with straight spine",
                "Gently tilt head to right shoulder",
                "Hold for 10 seconds",
                "Return to center",
                "Repeat on left side",
                "Complete 5 repetitions each side"
            ],
            benefits: [
                "Improves lateral neck mobility",
                "Reduces neck stiffness",
                "Enhances muscle flexibility"
            ]
        ),
        Exercise(
            name: "Neck Resistance",
            bodyPart: .neck,
            description: "Isometric exercise for neck strength",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Place hand on forehead",
                "Push head into hand while resisting movement",
                "Hold for 10 seconds",
                "Repeat with hand on back of head",
                "Complete 3 sets in each direction"
            ],
            benefits: [
                "Builds neck muscle strength",
                "Improves neck stability",
                "Helps prevent neck injuries"
            ]
        ),

        // NECK
        Exercise(
            name: "Neck Release",
            bodyPart: .neck,
            description: "Gentle stretching for neck tension relief",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit or stand with straight posture",
                "Slowly tilt head to right shoulder",
                "Hold for 30 seconds",
                "Repeat on left side",
                "Perform 3 sets each side"
            ],
            benefits: [
                "Relieves neck tension",
                "Improves neck mobility",
                "Reduces headache risk"
            ]
        ),
        Exercise(
            name: "Chin Tucks",
            bodyPart: .neck,
            description: "Strengthening exercise for deep neck flexors",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit with back straight",
                "Draw chin straight back (make double chin)",
                "Hold for 5 seconds",
                "Repeat 10 times"
            ],
            benefits: [
                "Improves posture",
                "Strengthens neck muscles",
                "Reduces forward head posture"
            ]
        ),
        Exercise(
            name: "Levator Scapulae Stretch",
            bodyPart: .neck,
            description: "Stretch targeting side of neck",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit with back straight",
                "Turn head 45 degrees to right",
                "Tilt chin down toward armpit",
                "Hold for 30 seconds",
                "Repeat on left side",
                "Perform 3 sets each side"
            ],
            benefits: [
                "Reduces neck stiffness",
                "Relieves upper back tension",
                "Improves mobility"
            ]
        ),
        Exercise(
            name: "Upper Trapezius Stretch",
            bodyPart: .neck,
            description: "Stretch to relieve neck and shoulder tension",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit or stand with good posture",
                "Gently pull head toward right armpit",
                "Hold for 30 seconds",
                "Repeat on left side",
                "Perform 3 sets each side"
            ],
            benefits: [
                "Reduces neck stiffness",
                "Relieves shoulder tension",
                "Improves flexibility"
            ]
        ),
        Exercise(
            name: "Neck Rotation",
            bodyPart: .neck,
            description: "Gentle rotational movements for neck mobility",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit with good posture",
                "Slowly turn head to look over right shoulder",
                "Hold for 10 seconds",
                "Repeat on left side",
                "Perform 5 repetitions each side"
            ],
            benefits: [
                "Improves neck range of motion",
                "Relieves muscle tension",
                "Enhances cervical mobility"
            ]
        ),
        Exercise(
            name: "Neck Isometrics",
            bodyPart: .neck,
            description: "Resistance exercises for neck strength",
            difficulty: .intermediate,
            duration: 360,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Place hand on forehead",
                "Push head into hand while resisting movement",
                "Hold for 10 seconds",
                "Repeat on sides and back",
                "Perform 3 sets each direction"
            ],
            benefits: [
                "Builds neck strength",
                "Improves stability",
                "Reduces risk of injury"
            ]
        ),
        
        Exercise(
            name: "Head Tilts",
            bodyPart: .neck,
            description: "Side-to-side neck mobility exercise",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit with straight spine",
                "Gently tilt head to right shoulder",
                "Hold for 10 seconds",
                "Return to center",
                "Repeat on left side",
                "Complete 5 repetitions each side"
            ],
            benefits: [
                "Improves lateral neck mobility",
                "Reduces neck stiffness",
                "Enhances muscle flexibility"
            ]
        ),
        Exercise(
            name: "Neck Resistance",
            bodyPart: .neck,
            description: "Isometric exercise for neck strength",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Place hand on forehead",
                "Push head into hand while resisting movement",
                "Hold for 10 seconds",
                "Repeat with hand on back of head",
                "Complete 3 sets in each direction"
            ],
            benefits: [
                "Builds neck muscle strength",
                "Improves neck stability",
                "Helps prevent neck injuries"
            ]
        ),


        // PELVIC FLOOR
        Exercise(
            name: "Basic Kegels",
            bodyPart: .genitals,
            description: "Foundation exercise for pelvic floor strength",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Contract pelvic floor muscles",
                "Hold for 5 seconds",
                "Release for 5 seconds",
                "Repeat 10 times",
                "Perform 3 sets"
            ],
            benefits: [
                "Improves bladder control",
                "Strengthens pelvic floor",
                "Enhances core stability"
            ]
        ),
        Exercise(
            name: "Quick Flicks",
            bodyPart: .genitals,
            description: "Rapid contractions for pelvic floor endurance",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Contract and release quickly",
                "Perform 10 quick contractions",
                "Rest for 10 seconds",
                "Repeat 3 sets"
            ],
            benefits: [
                "Builds muscle endurance",
                "Improves muscle coordination",
                "Enhances pelvic stability"
            ]
        ),
        Exercise(
            name: "Wall Squats with Pelvic Floor Engagement",
            bodyPart: .genitals,
            description: "Combines squats with pelvic floor contraction",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand with back against wall",
                "Lower into squat while contracting pelvic floor",
                "Hold for 5 seconds",
                "Rise back up and relax muscles",
                "Perform 10 repetitions"
            ],
            benefits: [
                "Strengthens pelvic floor",
                "Improves leg strength",
                "Enhances core stability"
            ]
        ),
        Exercise(
            name: "Bridge with Pelvic Floor Engagement",
            bodyPart: .genitals,
            description: "Combines glute bridge with pelvic floor contraction",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Lie on back with knees bent",
                "Contract pelvic floor muscles",
                "Lift hips into bridge position",
                "Hold for 5 seconds",
                "Lower hips and relax muscles",
                "Perform 10 repetitions"
            ],
            benefits: [
                "Strengthens pelvic floor",
                "Enhances core stability",
                "Improves glute strength"
            ]
        ),
        Exercise(
            name: "Elevator Kegels",
            bodyPart: .genitals,
            description: "Progressive pelvic floor engagement",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Imagine pelvic floor as elevator",
                "Contract muscles progressively higher",
                "Release progressively lower",
                "Perform 10 complete 'elevations'",
                "Rest between sets"
            ],
            benefits: [
                "Improves muscle control",
                "Enhances awareness",
                "Strengthens deep muscles"
            ]
        ),
        Exercise(
            name: "Pelvic Tilts",
            bodyPart: .genitals,
            description: "Combined core and pelvic floor exercise",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Lie on back with knees bent",
                "Tilt pelvis to flatten lower back",
                "Engage pelvic floor muscles",
                "Hold for 5 seconds",
                "Perform 10 repetitions"
            ],
            benefits: [
                "Coordinates muscle groups",
                "Improves posture",
                "Strengthens core connection"
            ]
        ),
        
        Exercise(
            name: "Standing Pelvic Tilts",
            bodyPart: .genitals,
            description: "Dynamic pelvic floor engagement exercise",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand with feet hip-width apart",
                "Gently tilt pelvis forward and back",
                "Engage pelvic floor muscles during movement",
                "Perform 15 repetitions",
                "Complete 3 sets"
            ],
            benefits: [
                "Improves core stability",
                "Enhances pelvic floor control",
                "Promotes better posture"
            ]
        ),
        Exercise(
            name: "Seated Pelvic Floor Pulses",
            bodyPart: .genitals,
            description: "Rhythmic pelvic floor muscle contractions",
            difficulty: .intermediate,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit on a firm chair",
                "Perform quick, light pelvic floor contractions",
                "Pulse for 30 seconds",
                "Rest for 10 seconds",
                "Repeat 3 sets"
            ],
            benefits: [
                "Increases muscle endurance",
                "Improves muscle tone",
                "Enhances neuromuscular control"
            ]
        ),

        // ANKLES
        Exercise(
            name: "Ankle Circles",
            bodyPart: .ankles,
            description: "Mobility exercise for ankle joints",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Lift foot off ground",
                "Rotate ankle clockwise 10 times",
                "Rotate counterclockwise 10 times",
                "Repeat with other ankle"
            ],
            benefits: [
                "Improves ankle mobility",
                "Reduces stiffness",
                "Prevents injuries"
            ]
        ),
        Exercise(
            name: "Calf Raises",
            bodyPart: .ankles,
            description: "Strengthening exercise for ankles and calves",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand on edge of step",
                "Rise up on toes",
                "Lower heels below step level",
                "Perform 15 repetitions",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens ankle joints",
                "Builds calf muscles",
                "Improves balance"
            ]
        ),
        Exercise(
            name: "Toe Raises",
            bodyPart: .ankles,
            description: "Strengthening exercise for anterior ankles",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand with feet shoulder-width apart",
                "Lift toes off ground while keeping heels down",
                "Hold for 2 seconds",
                "Lower toes back down",
                "Perform 15 repetitions",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens ankle muscles",
                "Improves mobility",
                "Prevents injuries"
                ]
        ),
        Exercise(
            name: "Resistance Band Ankle Flexion",
            bodyPart: .ankles,
            description: "Strengthens ankle dorsiflexors",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit with legs extended",
                "Loop band around foot, hold ends",
                "Pull foot toward you against resistance",
                "Slowly release",
                "Perform 15 repetitions each side",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens ankle muscles",
                "Improves mobility",
                "Prevents injuries"
            ]
        ),
        
        Exercise(
            name: "Standing Balance",
            bodyPart: .ankles,
            description: "Single-leg balance for ankle stability",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand on one leg",
                "Hold position for 30 seconds",
                "Switch legs",
                "Use wall for support if needed",
                "Repeat 3 times each leg"
            ],
            benefits: [
                "Improves ankle stability",
                "Enhances proprioception",
                "Strengthens supporting muscles"
            ]
        ),
        Exercise(
            name: "Walking on Heels",
            bodyPart: .ankles,
            description: "Ankle and lower leg strength exercise",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Walk 10 steps on heels",
                "Keep toes lifted off ground",
                "Maintain straight legs",
                "Return to normal walking",
                "Repeat 3 times"
            ],
            benefits: [
                "Strengthens ankle muscles",
                "Improves ankle mobility",
                "Enhances lower leg strength"
            ]
        ),

        //        // HIPS
        Exercise(
            name: "Hip Flexor Stretch",
            bodyPart: .hips,
            description: "Stretching exercise for the front of the hips",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Kneel on right knee, left foot in front",
                "Push hips forward gently",
                "Hold for 30 seconds",
                "Switch sides",
                "Repeat 3 times each side"
            ],
            benefits: [
                "Increases hip flexibility",
                "Reduces lower back strain",
                "Improves posture"
            ]
        ),
        Exercise(
            name: "Glute Bridges",
            bodyPart: .hips,
            description: "Strengthening exercise for glutes and hips",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Lie on back with knees bent",
                "Lift hips by squeezing glutes",
                "Hold for 2 seconds at the top",
                "Lower hips back down",
                "Perform 15 repetitions",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens glutes and hamstrings",
                "Stabilizes hip joints",
                "Improves core strength"
            ]
        ),
        Exercise(
            name: "Pigeon Pose",
            bodyPart: .hips,
            description: "Deep stretch for hip rotators",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Begin in plank position",
                "Bring right knee forward behind right wrist",
                "Extend left leg back",
                "Hold for 1 minute",
                "Switch sides",
                "Perform 2 sets each side"
            ],
            benefits: [
                "Opens hip joints",
                "Stretches glutes",
                "Improves flexibility"
            ]
        ),
        Exercise(
            name: "Clamshells",
            bodyPart: .hips,
            description: "Strengthening exercise for hip abductors",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Lie on side with knees bent",
                "Keep feet together, lift top knee",
                "Hold for 2 seconds",
                "Lower knee back down",
                "Perform 15 repetitions each side",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens gluteus medius",
                "Improves hip stability",
                "Reduces knee pain"
            ]
        ),
        
        Exercise(
            name: "Standing Hip Circles",
            bodyPart: .hips,
            description: "Dynamic mobility exercise for hips",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand on one leg",
                "Rotate other leg in large circles",
                "10 circles clockwise",
                "10 circles counterclockwise",
                "Switch legs"
            ],
            benefits: [
                "Improves hip mobility",
                "Reduces hip stiffness",
                "Enhances joint flexibility"
            ]
        ),
        Exercise(
            name: "Standing Hip Abduction",
            bodyPart: .hips,
            description: "Lateral hip strengthening exercise",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand with feet together",
                "Lift leg out to side",
                "Hold for 2 seconds",
                "Lower slowly",
                "Perform 15 repetitions per leg",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens hip muscles",
                "Improves lateral stability",
                "Reduces risk of hip injuries"
            ]
        ),


        // SHOULDERS
        Exercise(
            name: "Shoulder Rolls",
            bodyPart: .shoulders,
            description: "Mobility exercise for shoulder joints",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand or sit up straight",
                "Roll shoulders forward in circular motion 10 times",
                "Roll shoulders backward 10 times",
                "Repeat 3 sets"
            ],
            benefits: [
                "Increases shoulder mobility",
                "Relieves tension",
                "Improves posture"
            ]
        ),
        Exercise(
            name: "Doorway Chest Stretch",
            bodyPart: .shoulders,
            description: "Stretching exercise for chest and shoulders",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand in doorway with arms on door frame",
                "Step forward slowly to feel a stretch",
                "Hold for 30 seconds",
                "Repeat 3 times"
            ],
            benefits: [
                "Opens up chest muscles",
                "Reduces shoulder rounding",
                "Enhances upper body flexibility"
            ]
        ),
        Exercise(
            name: "Wall Angels",
            bodyPart: .shoulders,
            description: "Mobility exercise for shoulders and upper back",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand with back against wall",
                "Place arms at 90 degrees against wall",
                "Slide arms up and down while keeping contact",
                "Perform 15 repetitions",
                "Complete 3 sets"
            ],
            benefits: [
                "Improves shoulder mobility",
                "Strengthens upper back",
                "Enhances posture"
            ]
        ),
        Exercise(
            name: "Shoulder External Rotation",
            bodyPart: .shoulders,
            description: "Strengthening exercise for rotator cuff",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Hold resistance band in both hands",
                "Keep elbows at sides, bent at 90 degrees",
                "Rotate forearms outward against resistance",
                "Return to starting position",
                "Perform 15 repetitions",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens rotator cuff muscles",
                "Improves shoulder stability",
                "Prevents injuries"
            ]
        ),
        Exercise(
            name: "External Rotation",
            bodyPart: .shoulders,
            description: "Strengthening for rotator cuff",
            difficulty: .intermediate,
            duration: 360,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand with elbow at side, bent 90°",
                "Rotate arm outward",
                "Control movement back",
                "Perform 15 repetitions each arm",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens rotator cuff",
                "Improves shoulder stability",
                "Prevents injury"
            ]
        ),
        
        Exercise(
            name: "Arm Circles",
            bodyPart: .shoulders,
            description: "Dynamic warm-up for shoulder mobility",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand with arms extended",
                "Make small forward circles",
                "10 circles forward",
                "10 circles backward",
                "Gradually increase circle size",
                "Repeat 3 sets"
            ],
            benefits: [
                "Increases shoulder mobility",
                "Warms up shoulder joints",
                "Improves range of motion"
            ]
        ),
        Exercise(
            name: "Shoulder Blade Squeeze",
            bodyPart: .shoulders,
            description: "Posture and upper back strengthening",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Stand or sit with straight back",
                "Squeeze shoulder blades together",
                "Hold for 5 seconds",
                "Release slowly",
                "Repeat 15 times"
            ],
            benefits: [
                "Improves posture",
                "Strengthens upper back",
                "Reduces shoulder tension"
            ]
        ),


        // LOWER BACK
        Exercise(
            name: "Cat-Cow Stretch",
            bodyPart: .lowerBack,
            description: "Dynamic stretch for spine flexibility",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Start on hands and knees",
                "Arch back up (cat position)",
                "Drop belly down and lift head (cow position)",
                "Alternate for 10 repetitions",
                "Perform 3 sets"
            ],
            benefits: [
                "Improves spinal flexibility",
                "Relieves lower back tension",
                "Enhances posture"
            ]
        ),
        Exercise(
            name: "Child's Pose",
            bodyPart: .lowerBack,
            description: "Restorative yoga pose for back relaxation",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Kneel on the floor, sit back on heels",
                "Lean forward, extending arms forward",
                "Rest forehead on the ground",
                "Hold for 1 minute",
                "Breathe deeply"
            ],
            benefits: [
                "Gently stretches lower back",
                "Reduces stress and fatigue",
                "Calms the mind"
            ]
        ),
        Exercise(
            name: "Bird Dog",
            bodyPart: .lowerBack,
            description: "Core stability exercise",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Start on hands and knees",
                "Extend right arm forward and left leg back",
                "Hold for 5 seconds",
                "Return to starting position",
                "Switch sides",
                "Perform 10 repetitions each side"
            ],
            benefits: [
                "Strengthens core muscles",
                "Improves balance",
                "Enhances spinal stability"
            ]
        ),
        Exercise(
            name: "Seated Forward Bend",
            bodyPart: .lowerBack,
            description: "Stretch for lower back and hamstrings",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit with legs extended forward",
                "Reach toward toes while keeping back straight",
                "Hold for 30 seconds",
                "Perform 3 sets"
            ],
            benefits: [
                "Stretches lower back",
                "Improves hamstring flexibility",
                "Reduces tension"
            ]
        ),
        Exercise(
            name: "Cat-Cow Stretch",
            bodyPart: .lowerBack,
            description: "Spinal mobility exercise",
            difficulty: .beginner,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Start on hands and knees",
                "Arch back upward (Cat)",
                "Sag back downward (Cow)",
                "Move slowly between positions",
                "Perform 10 repetitions"
            ],
            benefits: [
                "Improves spinal mobility",
                "Relieves back tension",
                "Enhances core awareness"
            ]
        ),
        Exercise(
            name: "Bird Dog",
            bodyPart: .lowerBack,
            description: "Stability exercise for back and core",
            difficulty: .intermediate,
            duration: 360,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Start on hands and knees",
                "Extend opposite arm and leg",
                "Hold for 10 seconds",
                "Alternate sides",
                "Perform 8 repetitions each side"
            ],
            benefits: [
                "Strengthens back muscles",
                "Improves balance",
                "Enhances core stability"
            ]
        ),
        
        Exercise(
            name: "Supermans",
            bodyPart: .lowerBack,
            description: "Back extension exercise for core strength",
            difficulty: .intermediate,
            duration: 300,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Lie face down on floor",
                "Simultaneously lift arms and legs",
                "Hold for 3 seconds",
                "Lower back down",
                "Repeat 12 times",
                "Complete 3 sets"
            ],
            benefits: [
                "Strengthens lower back",
                "Improves core stability",
                "Enhances spinal muscle endurance"
            ]
        ),
        Exercise(
            name: "Prone Back Extensions",
            bodyPart: .lowerBack,
            description: "Gentle back strengthening exercise",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Lie face down, arms by sides",
                "Lift upper body slightly off ground",
                "Hold for 5 seconds",
                "Lower back down",
                "Repeat 10 times"
            ],
            benefits: [
                "Reduces lower back pain",
                "Improves back muscle strength",
                "Enhances posture"
            ]
        ),

        // JAW (TMJ)
        Exercise(
            name: "Jaw Relaxation",
            bodyPart: .jaw,
            description: "Exercise to relieve jaw tension",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Sit comfortably with relaxed shoulders",
                "Gently open mouth as wide as comfortable",
                "Hold for 5 seconds",
                "Slowly close mouth",
                "Repeat 10 times"
            ],
            benefits: [
                "Reduces jaw tension",
                "Relieves TMJ discomfort",
                "Improves jaw mobility"
            ]
        ),
        Exercise(
            name: "Resisted Opening",
            bodyPart: .jaw,
            description: "Strengthening exercise for jaw muscles",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Place thumb under chin",
                "Gently press down while trying to open mouth",
                "Hold for 5 seconds",
                "Release and relax",
                "Repeat 10 times"
            ],
            benefits: [
                "Strengthens jaw muscles",
                "Improves jaw function",
                "Reduces TMJ symptoms"
            ]
        ),
        Exercise(
            name: "Controlled Opening",
            bodyPart: .jaw,
            description: "Exercise to improve jaw movement",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Place tongue on roof of mouth",
                "Slowly open mouth as wide as comfortable",
                "Hold for 5 seconds",
                "Close mouth slowly",
                "Repeat 10 times"
            ],
            benefits: [
                "Improves jaw mobility",
                "Reduces clicking",
                "Relieves TMJ tension"
            ]
        ),
        Exercise(
            name: "Side-to-Side Movement",
            bodyPart: .jaw,
            description: "Exercise to enhance lateral jaw movement",
            difficulty: .intermediate,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Gently move jaw to the left",
                "Hold for 5 seconds",
                "Move jaw to the right",
                "Hold for 5 seconds",
                "Repeat 10 times"
            ],
            benefits: [
                "Improves jaw flexibility",
                "Reduces stiffness",
                "Enhances function"
            ]
        ),
        Exercise(
            name: "Jaw Relaxation",
            bodyPart: .jaw,
            description: "Gentle exercises for TMJ relief",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Rest tongue on roof of mouth",
                "Allow jaw to relax completely",
                "Create small gap between teeth",
                "Hold for 30 seconds",
                "Repeat 5 times"
            ],
            benefits: [
                "Reduces TMJ tension",
                "Relieves jaw pain",
                "Promotes proper jaw alignment"
            ]
        ),
        Exercise(
            name: "Jaw Stretches",
            bodyPart: .jaw,
            description: "Stretching exercises for jaw mobility",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Open mouth slowly and widely",
                "Hold for 5 seconds",
                "Close mouth slowly",
                "Repeat 10 times"
            ],
            benefits: [
                "Improves jaw mobility",
                "Reduces clicking sounds",
                "Relieves muscle tension"
            ]
        ),
        
        Exercise(
            name: "Tongue Press",
            bodyPart: .jaw,
            description: "TMJ relief and jaw muscle relaxation",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Press tongue against roof of mouth",
                "Hold for 5 seconds",
                "Release and relax",
                "Repeat 10 times"
            ],
            benefits: [
                "Reduces jaw tension",
                "Improves jaw muscle control",
                "Promotes relaxation"
            ]
        ),
        Exercise(
            name: "Neck and Jaw Stretch",
            bodyPart: .jaw,
            description: "Combined neck and jaw mobility exercise",
            difficulty: .intermediate,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Gently turn head to right",
                "Place hand on jaw for gentle resistance",
                "Hold for 10 seconds",
                "Return to center",
                "Repeat on left side"
            ],
            benefits: [
                "Improves jaw and neck mobility",
                "Reduces muscle tension",
                "Enhances range of motion"
            ]
        ),

        // EYES
        Exercise(
            name: "Palming",
            bodyPart: .eyes,
            description: "Relaxation technique to relieve eye strain",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Rub palms together to generate heat",
                "Gently place palms over closed eyes",
                "Relax and breathe deeply for 1 minute",
                "Repeat 3 times"
            ],
            benefits: [
                "Relieves eye fatigue",
                "Promotes relaxation",
                "Reduces stress"
            ]
        ),
        Exercise(
            name: "Focus Change",
            bodyPart: .eyes,
            description: "Exercise to improve eye flexibility",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Hold finger a few inches from eye",
                "Focus on finger, then on object 10 feet away",
                "Alternate focus every 5 seconds",
                "Repeat for 2 minutes"
            ],
            benefits: [
                "Enhances focusing ability",
                "Reduces eye strain",
                "Improves eye muscle flexibility"
            ]
        ),
        Exercise(
            name: "Eye Rolling",
            bodyPart: .eyes,
            description: "Exercise to relax eye muscles",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Close eyes gently",
                "Slowly roll eyes in circular motion",
                "Rotate clockwise 10 times",
                "Rotate counterclockwise 10 times",
                "Repeat 3 sets"
            ],
            benefits: [
                "Relaxes eye muscles",
                "Reduces eye strain",
                "Improves circulation"
            ]
        ),
        
        Exercise(
            name: "Near-Far Focus",
            bodyPart: .eyes,
            description: "Eye focusing and coordination exercise",
            difficulty: .beginner,
            duration: 240,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Hold thumb 6 inches from face",
                "Focus on thumb for 5 seconds",
                "Look at distant object",
                "Alternate focus every 5 seconds",
                "Repeat for 2 minutes"
            ],
            benefits: [
                "Improves eye muscle flexibility",
                "Reduces eye strain",
                "Enhances focus control"
            ]
        ),
        
        Exercise(
            name: "Pencil Push-Ups",
            bodyPart: .eyes,
            description: "Convergence exercise for eye coordination",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Hold pencil at arm's length",
                "Slowly bring pencil closer to nose",
                "Keep pencil in focus",
                "Stop when double vision occurs",
                "Repeat 10 times"
            ],
            benefits: [
                "Improves eye muscle coordination",
                "Reduces eye strain",
                "Enhances near-vision focus"
            ]
        ),
        
        Exercise(
            name: "Figure Eight",
            bodyPart: .eyes,
            description: "Enhances eye coordination and flexibility",
            difficulty: .beginner,
            duration: 180,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Imagine a large figure eight in front of you",
                "Trace it slowly with your eyes for 1 minute",
                "Switch direction",
                "Repeat 3 sets"
            ],
            benefits: [
                "Improves eye movement",
                "Reduces eye fatigue",
                "Enhances coordination"
            ]
        ),
        

        // Advanced Difficulty Exercises

        // WRISTS
        Exercise(
            name: "Weighted Wrist Roller Complex",
            bodyPart: .wrists,
            description: "Advanced grip and forearm strength challenge",
            difficulty: .advanced,
            duration: 480,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Use a weighted wrist roller with 10-15 lbs",
                "Roll weight up using only wrist movement",
                "Alternate between pronation and supination",
                "Complete full rotation without dropping weight",
                "Perform 3 complete up and down cycles",
                "Rest 1 minute between sets"
            ],
            benefits: [
                "Extreme grip strength development",
                "Advanced forearm muscle conditioning",
                "Enhances neuromuscular wrist control"
            ]
        ),
        Exercise(
            name: "Planche Wrist Preparation",
            bodyPart: .wrists,
            description: "Advanced isometric wrist strengthening",
            difficulty: .advanced,
            duration: 600,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Start in push-up position with fingers pointing backward",
                "Shift weight forward, maintaining straight arms",
                "Hold position with maximum wrist extension",
                "Progressively increase hold time",
                "Perform 5 sets of 45-second holds",
                "Rest 2 minutes between sets"
            ],
            benefits: [
                "Extreme wrist strength and resilience",
                "Prepares for advanced gymnastic movements",
                "Develops extraordinary joint stability"
            ]
        ),

        // NECK
        Exercise(
            name: "Dynamic Neck Bridge",
            bodyPart: .neck,
            description: "Advanced neck strength and mobility exercise",
            difficulty: .advanced,
            duration: 420,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Begin in wrestler's bridge position",
                "Slowly roll head side to side",
                "Maintain constant bridge tension",
                "Progress to full neck bridge movements",
                "Perform 15 side-to-side rotations",
                "Complete 3 sets with 2-minute rest"
            ],
            benefits: [
                "Extreme neck strength development",
                "Advanced proprioceptive training",
                "Significant mobility enhancement"
            ]
        ),
        Exercise(
            name: "Resistance Band Neck Progression",
            bodyPart: .neck,
            description: "Multi-directional neck resistance training",
            difficulty: .advanced,
            duration: 480,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Secure heavy resistance band at head height",
                "Perform resistance movements in all directions",
                "Include forward, backward, and rotational resistance",
                "Maintain perfect spine alignment",
                "3 sets of 20 repetitions per direction",
                "Use maximum tolerable resistance"
            ],
            benefits: [
                "Comprehensive neck muscle development",
                "Advanced injury prevention protocols",
                "Extreme multi-planar strength"
            ]
        ),

        // PELVIC FLOOR
        Exercise(
            name: "Advanced Stability Ball Pelvic Integration",
            bodyPart: .genitals,
            description: "Complex pelvic floor and core stabilization",
            difficulty: .advanced,
            duration: 600,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Balance on stability ball in half-kneeling position",
                "Perform simultaneous pelvic floor contraction",
                "Maintain perfect balance while changing arm positions",
                "Include weight shifting and dynamic movements",
                "Hold each variation for 45 seconds",
                "Complete 4 different challenging positions"
            ],
            benefits: [
                "Extreme core and pelvic floor coordination",
                "Advanced neuromuscular control",
                "Comprehensive stability enhancement"
            ]
        ),
        Exercise(
            name: "Plyometric Pelvic Floor Engagement",
            bodyPart: .genitals,
            description: "High-intensity pelvic floor conditioning",
            difficulty: .advanced,
            duration: 480,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform explosive jump squats",
                "Integrate maximum pelvic floor contraction during landing",
                "Maintain precise muscle engagement",
                "Include varying jump heights and directions",
                "Perform 5 sets of 15 repetitions",
                "Minimal rest between sets"
            ],
            benefits: [
                "Explosive pelvic floor strength",
                "Advanced dynamic muscle control",
                "Enhanced athletic performance integration"
            ]
        ),

        // ANKLES
        Exercise(
            name: "Multi-Plane Instability Platform Training",
            bodyPart: .ankles,
            description: "Advanced ankle stability and proprioception",
            difficulty: .advanced,
            duration: 540,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Use unstable surface like BOSU or balance board",
                "Perform complex single-leg movements",
                "Include weight shifts, rotations, and dynamic loads",
                "Maintain perfect balance during challenging sequences",
                "3 sets of 90-second continuous challenges",
                "Progress with added weights or closed eyes"
            ],
            benefits: [
                "Extreme ankle joint stability",
                "Advanced neuromuscular adaptation",
                "Comprehensive injury prevention"
            ]
        ),
        Exercise(
            name: "Advanced Plyometric Ankle Conditioning",
            bodyPart: .ankles,
            description: "High-intensity ankle strength and reactivity",
            difficulty: .advanced,
            duration: 600,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform depth jumps from elevated platforms",
                "Focus on minimal ground contact time",
                "Include multi-directional explosive movements",
                "Maintain perfect landing mechanics",
                "5 sets of 12 complex jumps",
                "Progressively increase jump height and complexity"
            ],
            benefits: [
                "Explosive ankle power development",
                "Advanced shock absorption capabilities",
                "Elite athletic performance enhancement"
            ]
        ),

        // HIPS
        Exercise(
            name: "Advanced Kettlebell Mobility Flow",
            bodyPart: .hips,
            description: "Complex hip mobility and strength integration",
            difficulty: .advanced,
            duration: 600,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Use heavy kettlebell for dynamic mobility sequences",
                "Perform continuous flow between Turkish get-ups",
                "Include windmills, figure-8s, and rotational movements",
                "Maintain perfect form under high complexity",
                "3 sets of 10-minute continuous flow",
                "Alternate dominant and non-dominant sides"
            ],
            benefits: [
                "Extreme hip mobility and strength",
                "Advanced movement pattern integration",
                "Comprehensive joint conditioning"
            ]
        ),
        Exercise(
            name: "Pistol Squat Progression",
            bodyPart: .hips,
            description: "Ultimate single-leg strength and stability",
            difficulty: .advanced,
            duration: 480,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform full range single-leg squats",
                "Progress to weighted and elevated variations",
                "Include pause and tempo modifications",
                "Maintain perfect alignment and control",
                "4 sets of 8 repetitions per leg",
                "Add complexity with external loads"
            ],
            benefits: [
                "Extreme lower body strength",
                "Advanced unilateral movement mastery",
                "Comprehensive hip and leg conditioning"
            ]
        ),

        // SHOULDERS
        Exercise(
            name: "Advanced Shoulder Stability Complex",
            bodyPart: .shoulders,
            description: "Multi-plane shoulder strength and mobility",
            difficulty: .advanced,
            duration: 540,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Use rings or suspension trainers",
                "Perform complex gymnastic-style shoulder movements",
                "Include skin the cats, muscle-ups, and inverted holds",
                "Maintain perfect control and alignment",
                "3 sets of 10-minute continuous movement",
                "Progress with increased complexity and time under tension"
            ],
            benefits: [
                "Extreme shoulder joint resilience",
                "Advanced movement pattern integration",
                "Comprehensive shoulder girdle conditioning"
            ]
        ),
        Exercise(
            name: "Heavy Overhead Stability Challenge",
            bodyPart: .shoulders,
            description: "Ultimate shoulder strength and stabilization",
            difficulty: .advanced,
            duration: 600,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform overhead lifts with maximal loads",
                "Include standing and seated variations",
                "Maintain perfect vertical alignment",
                "Progressively increase time under tension",
                "4 sets of complex overhead hold sequences",
                "Integrate unstable surface challenges"
            ],
            benefits: [
                "Extreme overhead strength development",
                "Advanced joint stability enhancement",
                "Elite athletic shoulder performance"
            ]
        ),

        // LOWER BACK
        Exercise(
            name: "Advanced Spinal Mobility Complex",
            bodyPart: .lowerBack,
            description: "Comprehensive spinal conditioning",
            difficulty: .advanced,
            duration: 540,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform advanced spine mobility flows",
                "Include complex twisting and extension sequences",
                "Use controlled, slow movements",
                "Maintain perfect segmental spinal control",
                "3 sets of 15-minute continuous movement",
                "Progress with added resistance and complexity"
            ],
            benefits: [
                "Extreme spinal mobility",
                "Advanced neuromuscular control",
                "Comprehensive back conditioning"
            ]
        ),
        Exercise(
            name: "Heavy Deadlift Progression",
            bodyPart: .lowerBack,
            description: "Ultimate lower back and posterior chain strength",
            difficulty: .advanced,
            duration: 480,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform complex deadlift variations",
                "Include deficit, pause, and tempo modifications",
                "Use maximal loads with perfect technique",
                "Integrate different grip and stance variations",
                "4 sets of 5 repetitions with progressive overload",
                "Maintain extreme technical precision"
            ],
            benefits: [
                "Extreme posterior chain strength",
                "Advanced biomechanical adaptation",
                "Elite strength development"
            ]
        ),

        // JAW
        Exercise(
            name: "Advanced TMJ Mobility Protocol",
            bodyPart: .jaw,
            description: "Comprehensive jaw mobility and tension release",
            difficulty: .advanced,
            duration: 420,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform complex jaw mobilization techniques",
                "Include myofascial release and muscle energy techniques",
                "Use precise, controlled movements",
                "Integrate breathing and relaxation protocols",
                "3 sets of 10-minute continuous work",
                "Progress with increased complexity"
            ],
            benefits: [
                "Extreme jaw mobility",
                "Advanced tension release",
                "Comprehensive facial muscle conditioning"
            ]
        ),
        Exercise(
            name: "Neuromuscular Jaw Coordination Challenge",
            bodyPart: .jaw,
            description: "Ultimate jaw muscle control and strength",
            difficulty: .advanced,
            duration: 480,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform complex jaw resistance protocols",
                "Include isometric and dynamic resistance variations",
                "Maintain perfect muscle engagement",
                "Integrate precise neuromuscular control techniques",
                "4 sets of intricate jaw movement sequences",
                "Progress with increased complexity"
            ],
            benefits: [
                "Extreme jaw muscle control",
                "Advanced neuromuscular coordination",
                "Comprehensive jaw function enhancement"
            ]
        ),

        // EYES
        Exercise(
            name: "Advanced Visual Tracking Complex",
            bodyPart: .eyes,
            description: "Ultimate eye muscle coordination and control",
            difficulty: .advanced,
            duration: 600,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform complex multi-object visual tracking",
                "Include rapid movement and changing patterns",
                "Maintain perfect focus under challenging conditions",
                "Integrate cognitive challenge with visual tasks",
                "3 sets of 15-minute continuous tracking",
                "Progress with increased complexity"
            ],
            benefits: [
                "Extreme eye muscle coordination",
                "Advanced visual processing",
                "Comprehensive neurological eye training"
            ]
        ),
        Exercise(
            name: "Neuro-Visual Integration Challenge",
            bodyPart: .eyes,
            description: "Complex visual-cognitive performance training",
            difficulty: .advanced,
            duration: 540,
            videoURL: URL(string: "https://video.wixstatic.com/video/1231c0_cd839a512226406d971c5199a2ab56bb/1080p/mp4/file.mp4"),
            steps: [
                "Perform advanced visual-cognitive integration tasks",
                "Include rapid decision-making with visual cues",
                "Maintain perfect focus and cognitive processing",
                "Integrate complex movement and visual challenges",
                "4 sets of intricate visual-motor sequences",
                "Progress with increased neurological complexity"
            ],
            benefits: [
                "Extreme visual-cognitive coordination",
                "Advanced neurological adaptation",
                "Comprehensive sensory-motor integration"
            ]
        )
    ]
}

