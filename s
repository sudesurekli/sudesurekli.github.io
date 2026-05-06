<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post-Class Activity Recommender</title>
    <!-- Modern and minimalist font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #ffffff;
            --text-color: #1a1a1a;
            --accent-color: #3b82f6;
            --secondary-bg: #f9fafb;
            --border-color: #e5e7eb;
            --transition-speed: 0.3s;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            line-height: 1.6;
        }

        .container {
            max-width: 500px;
            width: 100%;
            text-align: center;
            padding: 40px 20px;
            border: 1px solid var(--border-color);
            border-radius: 12px;
            background-color: var(--bg-color);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }

        header h1 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 8px;
            letter-spacing: -0.025em;
        }

        header p {
            font-size: 0.9rem;
            color: #6b7280;
            margin-bottom: 40px;
        }

        .card {
            min-height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            transition: opacity var(--transition-speed), transform var(--transition-speed);
        }

        .question-text {
            font-size: 1.2rem;
            font-weight: 400;
            margin-bottom: 24px;
        }

        .options-container {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        button {
            background-color: var(--bg-color);
            border: 1px solid var(--border-color);
            padding: 14px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 400;
            transition: all var(--transition-speed);
            color: var(--text-color);
        }

        button:hover {
            background-color: var(--secondary-bg);
            border-color: var(--accent-color);
            transform: translateY(-1px);
        }

        button:active {
            transform: translateY(0);
        }

        .result-container {
            padding: 20px;
            background-color: var(--secondary-bg);
            border-radius: 8px;
            margin-top: 10px;
        }

        .result-title {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: #6b7280;
            margin-bottom: 8px;
        }

        .result-text {
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--accent-color);
        }

        .reset-btn {
            margin-top: 30px;
            background-color: transparent;
            border: none;
            color: #9ca3af;
            text-decoration: underline;
            font-size: 0.85rem;
            cursor: pointer;
        }

        .reset-btn:hover {
            color: var(--text-color);
        }

        /* Transition animations */
        .fade-out {
            opacity: 0;
            transform: scale(0.98);
        }

        .fade-in {
            opacity: 1;
            transform: scale(1);
        }

        footer {
            margin-top: 40px;
            font-size: 0.75rem;
            color: #9ca3af;
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <h1>Activity Recommender</h1>
        <p>What should you do after class?</p>
    </header>

    <div id="app-content" class="card">
        <!-- Content injected by JavaScript -->
    </div>

    <footer>
        Minimalist University Recommender &copy; 2026
    </footer>
</div>

<script>
    const appContent = document.getElementById('app-content');

    // Application Logic (Derived from Flowchart)
    const steps = {
        start: {
            question: "What do you want to do after class?",
            options: [
                { text: "Study", next: "study_who" },
                { text: "Eat", next: "eat_time" },
                { text: "Relax", next: "relax_energy" },
                { text: "Fun", next: "fun_who" }
            ]
        },
        // --- STUDY BRANCH ---
        study_who: {
            question: "Are you alone or with friends?",
            options: [
                { text: "Alone", next: "study_time" },
                { text: "With friends", next: "result_yasar_cafes" }
            ]
        },
        study_time: {
            question: "Do you have enough time?",
            options: [
                { text: "Short time", next: "result_yasar_cafes" },
                { text: "Long time", next: "result_library_style" }
            ]
        },
        // --- EAT BRANCH ---
        eat_time: {
            question: "Do you have short or long time?",
            options: [
                { text: "Short time", next: "result_yasar_cafes" },
                { text: "Long time", next: "eat_where" }
            ]
        },
        eat_where: {
            question: "Do you want to stay nearby or go far?",
            options: [
                { text: "Nearby", next: "result_forum_bornova" },
                { text: "Far", next: "result_istinye_park" }
            ]
        },
        // --- RELAX BRANCH ---
        relax_energy: {
            question: "Are you tired or energetic?",
            options: [
                { text: "Tired", next: "relax_vibe" },
                { text: "Energetic", next: "relax_where" }
            ]
        },
        relax_vibe: {
            question: "Do you prefer calm or social places?",
            options: [
                { text: "Calm", next: "result_bostanli" },
                { text: "Social", next: "result_alsancak" }
            ]
        },
        relax_where: {
            question: "Do you want to stay nearby or go far?",
            options: [
                { text: "Nearby", next: "result_forum_bornova" },
                { text: "Far", next: "result_alsancak" }
            ]
        },
        // --- FUN BRANCH ---
        fun_who: {
            question: "Are you alone or with friends?",
            options: [
                { text: "Alone", next: "result_folkart_cinema" },
                { text: "With friends", next: "fun_where" }
            ]
        },
        fun_where: {
            question: "Do you want to stay nearby or go far?",
            options: [
                { text: "Nearby", next: "result_forum_bornova" },
                { text: "Far", next: "result_folkart_cinema" }
            ]
        },
        // --- RESULTS (TERMINAL NODES) ---
        result_yasar_cafes: { result: "Nearby Cafes around Yaşar" },
        result_library_style: { result: "Quiet Study Place / Library-style Café" },
        result_forum_bornova: { result: "Forum Bornova" },
        result_istinye_park: { result: "Istinye Park" },
        result_bostanli: { result: "Bostanlı / Karşıyaka Coast" },
        result_alsancak: { result: "Alsancak" },
        result_folkart_cinema: { result: "Cinema at Folkart Bornova" }
    };

    function renderStep(stepKey) {
        const step = steps[stepKey];
        
        // Transition animation: Fade out
        appContent.classList.add('fade-out');

        setTimeout(() => {
            appContent.innerHTML = '';

            if (step.question) {
                // Question View
                const questionEl = document.createElement('div');
                questionEl.className = 'question-text';
                questionEl.innerText = step.question;
                
                const optionsEl = document.createElement('div');
                optionsEl.className = 'options-container';

                step.options.forEach(opt => {
                    const btn = document.createElement('button');
                    btn.innerText = opt.text;
                    btn.onclick = () => renderStep(opt.next);
                    optionsEl.appendChild(btn);
                });

                appContent.appendChild(questionEl);
                appContent.appendChild(optionsEl);
            } else if (step.result) {
                // Result View
                const resContainer = document.createElement('div');
                resContainer.className = 'result-container';
                
                const resTitle = document.createElement('div');
                resTitle.className = 'result-title';
                resTitle.innerText = "Our Recommendation:";

                const resText = document.createElement('div');
                resText.className = 'result-text';
                resText.innerText = step.result;

                resContainer.appendChild(resTitle);
                resContainer.appendChild(resText);
                appContent.appendChild(resContainer);

                // Start Over Button
                const resetBtn = document.createElement('button');
                resetBtn.className = 'reset-btn';
                resetBtn.innerText = "Start Over";
                resetBtn.onclick = () => renderStep('start');
                appContent.appendChild(resetBtn);
            }

            // Transition animation: Fade in
            appContent.classList.remove('fade-out');
            appContent.classList.add('fade-in');
        }, 200);
    }

    // Initialize application on window load
    window.onload = () => renderStep('start');
</script>

</body>
</html>
