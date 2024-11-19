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

        // NECK
        Exercise(
            name: "Neck Release",
            bodyPart: .neck,
            description: "Gentle stretching for neck tension relief",
            difficulty: .beginner,
            duration: 300,
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

        // PELVIC FLOOR
        Exercise(
            name: "Basic Kegels",
            bodyPart: .genitals,
            description: "Foundation exercise for pelvic floor strength",
            difficulty: .beginner,
            duration: 300,
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

        // ANKLES
        Exercise(
            name: "Ankle Circles",
            bodyPart: .ankles,
            description: "Mobility exercise for ankle joints",
            difficulty: .beginner,
            duration: 240,
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

        //        // HIPS
        Exercise(
            name: "Hip Flexor Stretch",
            bodyPart: .hips,
            description: "Stretching exercise for the front of the hips",
            difficulty: .beginner,
            duration: 300,
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

        // SHOULDERS
        Exercise(
            name: "Shoulder Rolls",
            bodyPart: .shoulders,
            description: "Mobility exercise for shoulder joints",
            difficulty: .beginner,
            duration: 180,
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

        // LOWER BACK
        Exercise(
            name: "Cat-Cow Stretch",
            bodyPart: .lowerBack,
            description: "Dynamic stretch for spine flexibility",
            difficulty: .beginner,
            duration: 300,
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

        // JAW (TMJ)
        Exercise(
            name: "Jaw Relaxation",
            bodyPart: .jaw,
            description: "Exercise to relieve jaw tension",
            difficulty: .beginner,
            duration: 180,
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

        // EYES
        Exercise(
            name: "Palming",
            bodyPart: .eyes,
            description: "Relaxation technique to relieve eye strain",
            difficulty: .beginner,
            duration: 180,
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
            name: "Figure Eight",
            bodyPart: .eyes,
            description: "Enhances eye coordination and flexibility",
            difficulty: .beginner,
            duration: 180,
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
        )
    ]
}
    
