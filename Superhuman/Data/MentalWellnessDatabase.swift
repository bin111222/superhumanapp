import Foundation

struct MentalWellnessDatabase {
    static let activities: [MentalWellnessActivity] = [
        // Meditation Activities
        MentalWellnessActivity(
            type: .meditation,
            title: "Mindful Observation",
            description: "Simple meditation focusing on present moment awareness",
            duration: 300,
            steps: [
                "Find a comfortable seated position",
                "Close your eyes or maintain a soft gaze",
                "Focus on your natural breath",
                "Observe thoughts without judgment",
                "Gently return focus to breath when mind wanders"
            ],
            benefits: [
                "Reduces stress and anxiety",
                "Improves focus and concentration",
                "Enhances emotional regulation",
                "Promotes mental clarity"
            ],
            tips: [
                "Start with short sessions",
                "Be patient with wandering thoughts",
                "Practice regularly for best results",
                "Find a quiet, comfortable space"
            ]
        ),
        
        MentalWellnessActivity(
            type: .meditation,
            title: "Loving-Kindness Meditation",
            description: "Meditation practice focusing on developing compassion",
            duration: 600,
            steps: [
                "Sit comfortably and close your eyes",
                "Begin with self-directed loving thoughts",
                "Extend thoughts to loved ones",
                "Include neutral people",
                "Finally extend to difficult people"
            ],
            benefits: [
                "Increases empathy",
                "Reduces negative emotions",
                "Improves relationships",
                "Boosts positive outlook"
            ],
            tips: [
                "Use specific phrases that resonate",
                "Start with easier subjects",
                "Don't force emotions",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .meditation,
            title: "Walking Meditation",
            description: "Mindful walking practice for active meditation",
            duration: 900,
            steps: [
                "Choose a quiet walking path",
                "Walk at a natural pace",
                "Focus on each step",
                "Notice body sensations",
                "Maintain present awareness"
            ],
            benefits: [
                "Combines exercise with mindfulness",
                "Improves physical awareness",
                "Reduces anxiety",
                "Enhances focus"
            ],
            tips: [
                "Start with short distances",
                "Choose quiet locations",
                "Maintain natural breathing",
                "Focus on foot sensations"
            ]
        ),
        
        // Additional Meditation Activities
        MentalWellnessActivity(
            type: .meditation,
            title: "Guided Visualization",
            description: "Meditation using guided imagery to relax and focus",
            duration: 600,
            steps: [
                "Find a comfortable position",
                "Close your eyes and take deep breaths",
                "Listen to the guided instructions",
                "Visualize the described scenes",
                "Gradually return to present moment"
            ],
            benefits: [
                "Enhances creativity",
                "Promotes relaxation",
                "Improves focus",
                "Reduces stress"
            ],
            tips: [
                "Choose a quiet environment",
                "Use high-quality guided recordings",
                "Stay open to the experience",
                "Practice regularly"
            ]
        ),
        
        MentalWellnessActivity(
            type: .meditation,
            title: "Mantra Meditation",
            description: "Repeating a word or phrase to maintain focus",
            duration: 450,
            steps: [
                "Select a meaningful mantra",
                "Sit comfortably and close eyes",
                "Repeat the mantra silently",
                "Focus on the sound and rhythm",
                "Gently redirect when distracted"
            ],
            benefits: [
                "Improves concentration",
                "Calms the mind",
                "Enhances spiritual growth",
                "Reduces stress"
            ],
            tips: [
                "Choose a simple mantra",
                "Keep a steady rhythm",
                "Avoid forcing the repetition",
                "Integrate into daily routine"
            ]
        ),
        
        MentalWellnessActivity(
            type: .meditation,
            title: "Transcendental Meditation",
            description: "Using a personal mantra to transcend thought",
            duration: 1200,
            steps: [
                "Sit comfortably with eyes closed",
                "Silently repeat your mantra",
                "Allow thoughts to pass without engagement",
                "Return to mantra when distracted",
                "Continue for the duration"
            ],
            benefits: [
                "Deep relaxation",
                "Reduces blood pressure",
                "Enhances self-awareness",
                "Promotes emotional stability"
            ],
            tips: [
                "Learn from a certified instructor",
                "Maintain consistency",
                "Create a peaceful environment",
                "Be patient with progress"
            ]
        ),
        
        MentalWellnessActivity(
            type: .meditation,
            title: "Zen Meditation (Zazen)",
            description: "Seated meditation focusing on posture and breath",
            duration: 900,
            steps: [
                "Sit in a comfortable position with straight spine",
                "Place hands in a specific mudra",
                "Focus on natural breathing",
                "Observe thoughts without attachment",
                "Maintain posture throughout"
            ],
            benefits: [
                "Enhances focus",
                "Promotes inner peace",
                "Improves posture",
                "Reduces stress"
            ],
            tips: [
                "Maintain upright posture",
                "Practice regularly",
                "Use a cushion for comfort",
                "Focus on breath without force"
            ]
        ),
        
        MentalWellnessActivity(
            type: .meditation,
            title: "Chakra Meditation",
            description: "Meditation focused on balancing the body's energy centers",
            duration: 750,
            steps: [
                "Sit comfortably and close eyes",
                "Focus on each chakra from base to crown",
                "Visualize each energy center glowing",
                "Use corresponding sounds or colors",
                "Breathe deeply while maintaining focus"
            ],
            benefits: [
                "Balances energy",
                "Enhances emotional stability",
                "Promotes overall wellbeing",
                "Increases self-awareness"
            ],
            tips: [
                "Learn about each chakra beforehand",
                "Use visual aids if helpful",
                "Stay relaxed and open",
                "Practice in a quiet space"
            ]
        ),
        
        MentalWellnessActivity(
            type: .meditation,
            title: "Breath Awareness Meditation",
            description: "Focusing solely on the breath to cultivate mindfulness",
            duration: 600,
            steps: [
                "Sit comfortably with straight spine",
                "Close eyes and take a few deep breaths",
                "Focus attention on the sensation of breathing",
                "Notice the rise and fall of the abdomen",
                "Gently return focus when distracted"
            ],
            benefits: [
                "Enhances concentration",
                "Reduces stress",
                "Promotes relaxation",
                "Improves emotional regulation"
            ],
            tips: [
                "Keep sessions consistent",
                "Avoid controlling the breath",
                "Use as a foundation for other practices",
                "Be patient with the process"
            ]
        ),
        
        MentalWellnessActivity(
            type: .meditation,
            title: "Sound Meditation (Nada Yoga)",
            description: "Using sounds or music to deepen meditation",
            duration: 800,
            steps: [
                "Choose calming sounds or chants",
                "Sit comfortably and close eyes",
                "Focus on the sounds without analysis",
                "Allow sounds to guide your focus",
                "Return to sounds when mind wanders"
            ],
            benefits: [
                "Deepens relaxation",
                "Enhances auditory awareness",
                "Reduces mental chatter",
                "Promotes inner peace"
            ],
            tips: [
                "Select high-quality sound recordings",
                "Use headphones for better immersion",
                "Avoid distracting environments",
                "Experiment with different sounds"
            ]
        ),
        
        // Breathing Activities
        MentalWellnessActivity(
            type: .breathing,
            title: "4-7-8 Breathing",
            description: "Calming breath technique for relaxation",
            duration: 300,
            steps: [
                "Sit comfortably with straight spine",
                "Inhale quietly through nose for 4 counts",
                "Hold breath for 7 counts",
                "Exhale completely through mouth for 8 counts",
                "Repeat cycle 4 times"
            ],
            benefits: [
                "Reduces anxiety",
                "Helps with sleep",
                "Lowers stress levels",
                "Improves focus"
            ],
            tips: [
                "Keep breathing smooth",
                "Don't force the breath",
                "Practice when stressed",
                "Can be done anywhere"
            ]
        ),

        MentalWellnessActivity(
            type: .breathing,
            title: "Box Breathing",
            description: "Square breathing pattern for stress relief",
            duration: 240,
            steps: [
                "Inhale for 4 counts",
                "Hold for 4 counts",
                "Exhale for 4 counts",
                "Hold empty for 4 counts",
                "Repeat pattern"
            ],
            benefits: [
                "Calms nervous system",
                "Improves concentration",
                "Reduces stress",
                "Increases mindfulness"
            ],
            tips: [
                "Visualize a square",
                "Keep counts even",
                "Adjust timing if needed",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .breathing,
            title: "Alternate Nostril Breathing (Nadi Shodhana)",
            description: "Balancing breath technique to harmonize the body and mind",
            duration: 480,
            steps: [
                "Sit comfortably and relax",
                "Use right thumb to close right nostril",
                "Inhale deeply through left nostril",
                "Close left nostril with ring finger",
                "Exhale through right nostril",
                "Inhale through right nostril",
                "Close right nostril and exhale through left",
                "Repeat cycle"
            ],
            benefits: [
                "Balances hemispheres of the brain",
                "Reduces stress",
                "Enhances mental clarity",
                "Promotes emotional stability"
            ],
            tips: [
                "Maintain a steady rhythm",
                "Keep breath smooth and deep",
                "Practice on an empty stomach",
                "Start with fewer cycles and increase gradually"
            ]
        ),

        MentalWellnessActivity(
            type: .breathing,
            title: "Diaphragmatic Breathing",
            description: "Deep breathing technique engaging the diaphragm",
            duration: 600,
            steps: [
                "Lie down or sit comfortably",
                "Place one hand on chest and one on abdomen",
                "Inhale deeply through nose, expanding abdomen",
                "Exhale slowly through mouth",
                "Focus on diaphragmatic movement"
            ],
            benefits: [
                "Improves lung capacity",
                "Reduces stress",
                "Enhances relaxation",
                "Promotes better posture"
            ],
            tips: [
                "Practice daily",
                "Use a timer to track breaths",
                "Maintain a relaxed posture",
                "Combine with meditation for best results"
            ]
        ),

        MentalWellnessActivity(
            type: .breathing,
            title: "Pursed Lip Breathing",
            description: "Breathing technique to improve respiratory function",
            duration: 300,
            steps: [
                "Inhale slowly through nose for 2 counts",
                "Purse lips as if whistling",
                "Exhale gently through pursed lips for 4 counts",
                "Repeat the cycle"
            ],
            benefits: [
                "Improves breathing efficiency",
                "Reduces shortness of breath",
                "Promotes relaxation",
                "Enhances oxygen exchange"
            ],
            tips: [
                "Keep exhalation longer than inhalation",
                "Use during physical activity if needed",
                "Maintain a comfortable rhythm",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .breathing,
            title: "Resonant Breathing",
            description: "Breathing at a rate of five breaths per minute to maximize heart rate variability",
            duration: 600,
            steps: [
                "Sit or lie down comfortably",
                "Inhale for 6 seconds",
                "Exhale for 6 seconds",
                "Maintain the rhythm",
                "Continue for the duration"
            ],
            benefits: [
                "Enhances heart rate variability",
                "Reduces stress",
                "Promotes relaxation",
                "Improves emotional regulation"
            ],
            tips: [
                "Use a timer or app to maintain rhythm",
                "Focus on the breath",
                "Stay relaxed",
                "Practice in a quiet environment"
            ]
        ),

        MentalWellnessActivity(
            type: .breathing,
            title: "Sitali Breath",
            description: "Cooling breath technique to calm the mind",
            duration: 400,
            steps: [
                "Sit comfortably with straight spine",
                "Roll tongue into a tube (if possible)",
                "Inhale deeply through the rolled tongue",
                "Close mouth and exhale through nose",
                "Repeat the cycle"
            ],
            benefits: [
                "Cools the body",
                "Reduces anxiety",
                "Promotes mental clarity",
                "Balances energy"
            ],
            tips: [
                "If unable to roll tongue, inhale through slightly parted lips",
                "Maintain a steady rhythm",
                "Use in warm environments",
                "Practice regularly for best results"
            ]
        ),

        MentalWellnessActivity(
            type: .breathing,
            title: "Kapalabhati (Skull Shining Breath)",
            description: "Energizing breath technique to invigorate the mind",
            duration: 300,
            steps: [
                "Sit comfortably with straight spine",
                "Take a deep inhale",
                "Forcefully exhale through nose, pulling abdomen inward",
                "Allow inhalation to happen naturally",
                "Repeat rapidly for several cycles"
            ],
            benefits: [
                "Energizes the body",
                "Cleanses the respiratory system",
                "Improves mental focus",
                "Reduces stress"
            ],
            tips: [
                "Start with fewer cycles and increase gradually",
                "Maintain a comfortable pace",
                "Avoid if you have high blood pressure",
                "Practice on an empty stomach"
            ]
        ),

        // Mindfulness Activities
        MentalWellnessActivity(
            type: .mindfulness,
            title: "Body Scan",
            description: "Progressive relaxation through body awareness",
            duration: 600,
            steps: [
                "Lie down comfortably",
                "Close eyes and focus on breathing",
                "Scan body from toes to head",
                "Notice sensations without judgment",
                "Release tension in each area"
            ],
            benefits: [
                "Reduces physical tension",
                "Improves body awareness",
                "Promotes relaxation",
                "Helps with stress"
            ],
            tips: [
                "Take your time",
                "Stay present",
                "Notice without changing",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .mindfulness,
            title: "Mindful Eating",
            description: "Practicing presence and awareness while eating",
            duration: 900,
            steps: [
                "Choose a small portion of food",
                "Observe appearance and smell",
                "Take small, mindful bites",
                "Notice flavors and textures",
                "Eat slowly and deliberately"
            ],
            benefits: [
                "Improves digestion",
                "Reduces overeating",
                "Enhances food enjoyment",
                "Increases awareness"
            ],
            tips: [
                "Remove distractions",
                "Start with simple foods",
                "Take your time",
                "Focus on sensations"
            ]
        ),

        MentalWellnessActivity(
            type: .mindfulness,
            title: "Mindful Walking",
            description: "Bringing awareness to each step while walking",
            duration: 600,
            steps: [
                "Choose a quiet path",
                "Walk at a natural pace",
                "Focus on the sensation of each step",
                "Notice the environment around you",
                "Maintain present moment awareness"
            ],
            benefits: [
                "Enhances physical awareness",
                "Reduces stress",
                "Improves focus",
                "Promotes relaxation"
            ],
            tips: [
                "Walk slowly to increase awareness",
                "Use all senses to engage with surroundings",
                "Avoid distractions like phones",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .mindfulness,
            title: "Mindful Listening",
            description: "Fully concentrating on sounds in the environment",
            duration: 300,
            steps: [
                "Sit comfortably and close eyes",
                "Focus on external sounds",
                "Identify different layers of sound",
                "Avoid labeling or judging sounds",
                "Maintain focus for the duration"
            ],
            benefits: [
                "Enhances auditory awareness",
                "Promotes relaxation",
                "Improves focus",
                "Reduces stress"
            ],
            tips: [
                "Choose a quiet environment",
                "Use headphones if necessary",
                "Let sounds come and go naturally",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .mindfulness,
            title: "Mindful Breathing",
            description: "Focusing attention on the breath to cultivate mindfulness",
            duration: 600,
            steps: [
                "Sit comfortably with straight spine",
                "Close eyes and take deep breaths",
                "Focus on the sensation of inhaling and exhaling",
                "Notice any distractions without judgment",
                "Gently return focus to breath"
            ],
            benefits: [
                "Enhances concentration",
                "Reduces stress",
                "Promotes relaxation",
                "Improves emotional regulation"
            ],
            tips: [
                "Maintain a steady rhythm",
                "Avoid controlling the breath",
                "Use as a foundation for other practices",
                "Be patient with the process"
            ]
        ),

        MentalWellnessActivity(
            type: .mindfulness,
            title: "Mindful Journaling",
            description: "Writing thoughts and feelings with full awareness",
            duration: 900,
            steps: [
                "Choose a quiet space and time",
                "Set a timer for the duration",
                "Write freely without judgment",
                "Focus on present thoughts and feelings",
                "Reflect on the writing after completion"
            ],
            benefits: [
                "Enhances self-awareness",
                "Reduces stress",
                "Improves emotional clarity",
                "Promotes personal growth"
            ],
            tips: [
                "Use prompts if needed",
                "Write consistently",
                "Be honest and open",
                "Avoid editing while writing"
            ]
        ),

        MentalWellnessActivity(
            type: .mindfulness,
            title: "Mindful Stretching",
            description: "Combining stretching exercises with mindful awareness",
            duration: 500,
            steps: [
                "Choose a series of gentle stretches",
                "Focus on each movement and sensation",
                "Breathe deeply and steadily",
                "Notice areas of tension",
                "Move slowly and deliberately"
            ],
            benefits: [
                "Improves flexibility",
                "Reduces physical tension",
                "Promotes relaxation",
                "Enhances body awareness"
            ],
            tips: [
                "Move at your own pace",
                "Listen to your body",
                "Avoid forcing any movements",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .mindfulness,
            title: "Mindful Art",
            description: "Engaging in creative activities with full attention",
            duration: 700,
            steps: [
                "Choose an art medium (drawing, painting, etc.)",
                "Set up a comfortable workspace",
                "Focus on the process, not the outcome",
                "Notice colors, shapes, and textures",
                "Stay present with each stroke or movement"
            ],
            benefits: [
                "Enhances creativity",
                "Promotes relaxation",
                "Improves focus",
                "Reduces stress"
            ],
            tips: [
                "Allow yourself to experiment",
                "Avoid judging your work",
                "Use calming music if desired",
                "Enjoy the process without pressure"
            ]
        ),

        // Visualization Activities
        MentalWellnessActivity(
            type: .visualization,
            title: "Safe Place Visualization",
            description: "Creating and visiting a mental sanctuary",
            duration: 600,
            steps: [
                "Get comfortable and close eyes",
                "Imagine a peaceful place",
                "Add sensory details",
                "Feel safety and peace",
                "Explore the environment"
            ],
            benefits: [
                "Reduces anxiety",
                "Creates mental escape",
                "Promotes relaxation",
                "Builds emotional resilience"
            ],
            tips: [
                "Use all senses",
                "Make it personal",
                "Practice regularly",
                "Add details over time"
            ]
        ),

        MentalWellnessActivity(
            type: .visualization,
            title: "Success Visualization",
            description: "Mental rehearsal of achieving goals",
            duration: 480,
            steps: [
                "Relax and close eyes",
                "Picture specific goal",
                "Imagine process and outcome",
                "Feel the success",
                "Add emotional content"
            ],
            benefits: [
                "Builds confidence",
                "Improves performance",
                "Increases motivation",
                "Enhances focus"
            ],
            tips: [
                "Be specific",
                "Include emotions",
                "Practice regularly",
                "Stay positive"
            ]
        ),

        MentalWellnessActivity(
            type: .visualization,
            title: "Healing Visualization",
            description: "Visualizing the body healing and rejuvenating",
            duration: 700,
            steps: [
                "Sit or lie down comfortably",
                "Close your eyes and take deep breaths",
                "Visualize the affected area healing",
                "Imagine healthy cells regenerating",
                "Feel gratitude for your body's resilience"
            ],
            benefits: [
                "Promotes physical healing",
                "Reduces stress",
                "Enhances body awareness",
                "Boosts immune function"
            ],
            tips: [
                "Be specific about the healing process",
                "Maintain a positive mindset",
                "Combine with deep breathing",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .visualization,
            title: "Future Self Visualization",
            description: "Imagining your future self and desired outcomes",
            duration: 600,
            steps: [
                "Find a comfortable position and close eyes",
                "Imagine yourself in the future",
                "Visualize your achievements and growth",
                "Feel the emotions of success",
                "Reflect on the steps to reach that future"
            ],
            benefits: [
                "Enhances goal setting",
                "Boosts motivation",
                "Improves self-confidence",
                "Clarifies personal aspirations"
            ],
            tips: [
                "Be detailed in your visualization",
                "Incorporate all senses",
                "Stay positive and realistic",
                "Use as a motivational tool"
            ]
        ),

        MentalWellnessActivity(
            type: .visualization,
            title: "Mountain Visualization",
            description: "Visualizing oneself as a strong and stable mountain",
            duration: 500,
            steps: [
                "Sit comfortably and close eyes",
                "Imagine a mountain scene",
                "Visualize yourself as a mountain",
                "Feel the strength and stability",
                "Embrace the calmness and resilience"
            ],
            benefits: [
                "Builds inner strength",
                "Promotes emotional stability",
                "Reduces anxiety",
                "Enhances resilience"
            ],
            tips: [
                "Use vivid imagery",
                "Focus on the qualities you associate with a mountain",
                "Combine with deep breathing",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .visualization,
            title: "Ocean Visualization",
            description: "Visualizing the calming and vast nature of the ocean",
            duration: 550,
            steps: [
                "Close your eyes and relax",
                "Imagine standing by the ocean",
                "Feel the breeze and hear the waves",
                "Visualize the expansive horizon",
                "Embrace the sense of peace and infinity"
            ],
            benefits: [
                "Promotes relaxation",
                "Reduces stress",
                "Enhances emotional balance",
                "Fosters a sense of peace"
            ],
            tips: [
                "Incorporate all senses into your visualization",
                "Focus on the rhythm of the waves",
                "Allow your mind to wander peacefully",
                "Practice in a quiet environment"
            ]
        ),

        MentalWellnessActivity(
            type: .visualization,
            title: "Goal Achievement Visualization",
            description: "Imagining the steps and success in achieving specific goals",
            duration: 700,
            steps: [
                "Sit comfortably and close eyes",
                "Visualize your specific goal in detail",
                "Imagine the steps you need to take",
                "See yourself overcoming challenges",
                "Feel the accomplishment upon achieving the goal"
            ],
            benefits: [
                "Clarifies goals",
                "Boosts motivation",
                "Enhances planning and execution",
                "Increases confidence"
            ],
            tips: [
                "Be as detailed as possible",
                "Focus on positive outcomes",
                "Visualize regularly",
                "Combine with actionable planning"
            ]
        ),

        MentalWellnessActivity(
            type: .visualization,
            title: "Light Visualization",
            description: "Imagining healing light enveloping the body",
            duration: 450,
            steps: [
                "Find a comfortable position and close eyes",
                "Take deep breaths to relax",
                "Visualize a warm, healing light",
                "See the light covering your body",
                "Feel the warmth and healing energy"
            ],
            benefits: [
                "Promotes relaxation",
                "Reduces stress",
                "Enhances emotional healing",
                "Improves mental clarity"
            ],
            tips: [
                "Choose a color that feels healing to you",
                "Focus on the sensation of warmth",
                "Allow the light to move at its own pace",
                "Practice regularly for best results"
            ]
        ),
        
        // Gratitude Activities
        MentalWellnessActivity(
            type: .gratitude,
            title: "Gratitude Journal",
            description: "Daily recording of things to be thankful for",
            duration: 300,
            steps: [
                "Choose specific time",
                "List three grateful items",
                "Add specific details",
                "Include why you're grateful",
                "Reflect on feelings"
            ],
            benefits: [
                "Increases happiness",
                "Improves outlook",
                "Reduces negativity",
                "Enhances wellbeing"
            ],
            tips: [
                "Be specific",
                "Write daily",
                "Include small things",
                "Feel the gratitude"
            ]
        ),

        MentalWellnessActivity(
            type: .gratitude,
            title: "Gratitude Letter",
            description: "Writing a thank you letter to someone important",
            duration: 1800,
            steps: [
                "Choose recipient",
                "Reflect on their impact",
                "Write detailed letter",
                "Express specific gratitude",
                "Consider sharing letter"
            ],
            benefits: [
                "Strengthens relationships",
                "Increases happiness",
                "Promotes connection",
                "Builds appreciation"
            ],
            tips: [
                "Be genuine",
                "Include specific examples",
                "Express feelings",
                "Take your time"
            ]
        ),

        MentalWellnessActivity(
            type: .gratitude,
            title: "Gratitude Meditation",
            description: "Meditation focusing on feelings of thankfulness",
            duration: 600,
            steps: [
                "Sit comfortably and close eyes",
                "Take deep breaths to relax",
                "Focus on things you're grateful for",
                "Visualize each grateful aspect",
                "Feel the emotions of gratitude"
            ],
            benefits: [
                "Enhances emotional wellbeing",
                "Reduces stress",
                "Promotes positive thinking",
                "Improves mental health"
            ],
            tips: [
                "Use specific examples",
                "Stay present with each thought",
                "Let gratitude fill your mind",
                "Practice regularly"
            ]
        ),

        MentalWellnessActivity(
            type: .gratitude,
            title: "Gratitude Walk",
            description: "Taking a walk while mentally listing things you're thankful for",
            duration: 900,
            steps: [
                "Choose a pleasant walking route",
                "Walk at a comfortable pace",
                "Mentally note things you're grateful for",
                "Focus on each gratitude as you walk",
                "Reflect on your feelings during the walk"
            ],
            benefits: [
                "Combines physical activity with gratitude",
                "Enhances mindfulness",
                "Reduces stress",
                "Boosts mood"
            ],
            tips: [
                "Choose a safe and quiet path",
                "Avoid distractions like phones",
                "Stay present with each step and thought",
                "Make it a regular practice"
            ]
        ),

        MentalWellnessActivity(
            type: .gratitude,
            title: "Gratitude Jar",
            description: "Collecting notes of gratitude in a jar to review later",
            duration: 300,
            steps: [
                "Find a jar and some paper",
                "Write down something you're grateful for",
                "Fold and place it in the jar",
                "Repeat daily or weekly",
                "Review the notes periodically"
            ],
            benefits: [
                "Creates a visual reminder of gratitude",
                "Encourages regular reflection",
                "Boosts long-term happiness",
                "Reduces stress"
            ],
            tips: [
                "Decorate the jar to make it inviting",
                "Be specific in your notes",
                "Involve family or friends",
                "Set aside time to review"
            ]
        ),

        MentalWellnessActivity(
            type: .gratitude,
            title: "Gratitude Affirmations",
            description: "Repeating positive statements of gratitude",
            duration: 400,
            steps: [
                "Choose or create affirmations",
                "Sit comfortably and close eyes",
                "Repeat affirmations slowly",
                "Focus on the meaning of each statement",
                "Feel the emotions behind the words"
            ],
            benefits: [
                "Reinforces positive thinking",
                "Enhances self-esteem",
                "Reduces negative thoughts",
                "Promotes emotional wellbeing"
            ],
            tips: [
                "Use present tense statements",
                "Keep affirmations positive",
                "Repeat with conviction",
                "Practice daily for best results"
            ]
        ),

        MentalWellnessActivity(
            type: .gratitude,
            title: "Gratitude Sharing",
            description: "Sharing things you're grateful for with others",
            duration: 600,
            steps: [
                "Choose a person to share with",
                "Sit together in a comfortable setting",
                "Take turns expressing gratitude",
                "Be specific and genuine",
                "Listen actively and attentively"
            ],
            benefits: [
                "Strengthens relationships",
                "Enhances mutual understanding",
                "Boosts collective happiness",
                "Promotes a positive environment"
            ],
            tips: [
                "Choose a time without distractions",
                "Be sincere in your expressions",
                "Encourage open and honest sharing",
                "Make it a regular practice"
            ]
        ),

        MentalWellnessActivity(
            type: .gratitude,
            title: "Gratitude Art",
            description: "Creating art that represents what you're thankful for",
            duration: 700,
            steps: [
                "Gather art supplies",
                "Choose elements to represent gratitude",
                "Create a visual representation",
                "Focus on each element with appreciation",
                "Reflect on the completed artwork"
            ],
            benefits: [
                "Enhances creativity",
                "Promotes emotional expression",
                "Boosts positive emotions",
                "Provides a tangible reminder of gratitude"
            ],
            tips: [
                "Use colors that resonate with your feelings",
                "Don't worry about artistic skill",
                "Focus on the process, not the outcome",
                "Display the artwork as a reminder"
            ]
        )
    ]
    
    static func activitiesForType(_ type: MentalWellnessType) -> [MentalWellnessActivity] {
        activities.filter { $0.type == type }
    }
}