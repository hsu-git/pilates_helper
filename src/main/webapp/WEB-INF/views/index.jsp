<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>필라테스 도우미 - 개인 맞춤형 필라테스 조언</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="./style.css">
    <link href="<%= request.getContextPath() %>/assets/style.css">
    <style>
        :root {
            --primary: #6a11cb;
            --secondary: #2575fc;
            --light: #f8f9fa;
            --dark: #212529;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: linear-gradient(120deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }

        .app-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border: none;
            margin-bottom: 2rem;
            background: rgba(255, 255, 255, 0.9);
        }

        .intro-card {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 2.5rem 2rem;
        }

        .question-form-card {
            padding: 2rem;
        }

        .response-card {
            max-height: 0;
            opacity: 0;
            transition: max-height 0.5s ease-out, opacity 0.5s ease-out, padding 0.5s ease-out;
            overflow: hidden;
            padding: 0 2rem;
        }

        .response-card.show {
            max-height: 1000px;
            opacity: 1;
            padding: 2rem;
        }

        .pilates-icon {
            width: 100%;
            max-width: 320px;
            margin: 1.5rem 0;
        }

        .btn-gradient {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            border-radius: 50px;
            padding: 0.5rem 2rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-gradient:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
            color: white;
        }

        #questionInput {
            border-radius: 50px;
            padding: 1rem 1.5rem;
            border: 1px solid #e9ecef;
            font-size: 1rem;
        }

        .features-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin: 2rem 0;
        }

        .feature-item {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

        .feature-item:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            margin-bottom: 1rem;
            color: var(--primary);
        }

        .rotating-text {
            min-height: 1.5em;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translate3d(0, 20px, 0);
            }
            to {
                opacity: 1;
                transform: translate3d(0, 0, 0);
            }
        }

        .animate-fadeInUp {
            animation: fadeInUp 0.6s ease forwards;
        }

        @media (max-width: 576px) {
            .intro-card, .question-form-card, .response-card.show {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
<!-- Main App Container -->
<div class="container app-container">
    <!-- Intro Card -->
    <div class="card intro-card text-center mb-4">
        <h1 class="display-5 fw-bold mb-3">필라테스 AI 도우미</h1>
        <p class="lead">개인 맞춤형 필라테스 조언을 받아보세요</p>

        <!-- Pilates SVG Icon -->
        <div class="text-center">
            <img id="main-image" src="<%= request.getContextPath() %>/images/main.webp">
        </div>

        <div class="rotating-text mt-3">
            <h5 id="rotatingText">건강한 몸과 마음을 위한 필라테스</h5>
        </div>
    </div>

    <!-- Question Form -->
    <div class="card question-form-card mb-4">
        <h3 class="mb-4 text-center">궁금한 점을 물어보세요</h3>
        <form id="questionForm">
            <div class="mb-3">
                <input type="text" class="form-control" id="questionInput" placeholder="예: 허리 통증에 좋은 필라테스 동작은 무엇인가요?">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-gradient">질문하기</button>
            </div>
        </form>
    </div>

    <!-- Response Card (hidden initially) -->
    <div class="card response-card" id="responseCard">
        <h4 class="mb-3">AI 필라테스 코치 답변:</h4>
        <div id="responseText" class="mb-4"></div>
        <div class="text-center mt-4">
            <button id="newQuestionBtn" class="btn btn-outline-primary">새로운 질문하기</button>
        </div>
    </div>

    <!-- Features Section -->
    <div class="features-section">
        <div class="feature-item text-center">
            <div class="feature-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412l3.09 3.09a.75.75 0 1 1-1.06 1.06L7.5 7.252V13.5a.75.75 0 0 1-1.5 0v-6.247l-3.45 3.45a.75.75 0 0 1-1.06-1.061l3.09-3.09a.75.75 0 0 1 1.06 0l3.45 3.45a.75.75 0 0 1 0 1.061z"/>
                </svg>
            </div>
            <h5>맞춤형 루틴</h5>
            <p>당신의 목표와 수준에 맞는 개인 맞춤형 필라테스 루틴</p>
        </div>

        <div class="feature-item text-center">
            <div class="feature-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
                    <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
                </svg>
            </div>
            <h5>전문가 조언</h5>
            <p>필라테스 전문가들의 지식을 기반으로 한 조언</p>
        </div>

        <div class="feature-item text-center">
            <div class="feature-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M8 13A5 5 0 1 1 8 3a5 5 0 0 1 0 10zm0 1A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                    <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/>
                    <path d="M9.5 8a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                </svg>
            </div>
            <h5>정확한 기술</h5>
            <p>필라테스 동작을 정확하게 수행하는 방법 안내</p>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<script>
    // Sample rotating texts
    const rotatingTexts = [
        "건강한 몸과 마음을 위한 필라테스",
        "자세 교정과 코어 강화에 집중하세요",
        "필라테스로 더 유연하고 강한 몸을 만들어보세요",
        "맞춤형 필라테스 조언을 받아보세요"
    ];

    let currentTextIndex = 0;
    const rotatingTextElement = document.getElementById('rotatingText');

    // Rotate texts every 4 seconds
    setInterval(() => {
        currentTextIndex = (currentTextIndex + 1) % rotatingTexts.length;
        rotatingTextElement.style.opacity = 0;

        setTimeout(() => {
            rotatingTextElement.textContent = rotatingTexts[currentTextIndex];
            rotatingTextElement.style.opacity = 1;
        }, 500);
    }, 4000);

    // Sample responses for demo
    const sampleResponses = [
        "허리 통증 완화를 위한 필라테스 동작으로는 고양이-소 자세(Cat-Cow Stretch), 골반 틸트(Pelvic Tilt), 브릿지(Bridge)가 효과적입니다. 이러한 동작들은 척추의 유연성을 높이고 코어 근육을 강화하여 허리 통증을 완화하는 데 도움을 줍니다. 하루에 10-15분씩 꾸준히 실천해 보세요.",
        "임산부를 위한 필라테스 루틴은 골반 강화와 자세 유지에 초점을 맞춰야 합니다. 사이드 레그 리프트, 수정된 형태의 플랭크, 심호흡과 함께하는 골반저근 운동이 효과적입니다. 항상 의사와 상담 후 시작하시고, 불편함이 있으면 즉시 중단하세요.",
        "필라테스를 처음 시작하시는 분들에게는 기본적인 호흡법과 코어 활성화부터 배우는 것이 중요합니다. '백그라운드 브리딩'과 '임프린트'같은 기초 동작으로 시작하여 점진적으로 난이도를 높여가는 것이 좋습니다. 주 2-3회, 30분씩 연습하면서 몸의 변화를 느껴보세요.",
        "목과 어깨 긴장 완화를 위한 필라테스 동작으로는 넥 롤(Neck Roll), 숄더 브릿지(Shoulder Bridge), 체스트 오프너(Chest Opener)가 효과적입니다. 이 동작들은 상체의 긴장을 풀고 혈액 순환을 개선하는 데 도움이 됩니다. 특히 컴퓨터 작업을 많이 하시는 분들에게 추천합니다."
    ];

    // Form submit event
    document.getElementById('questionForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const questionInput = document.getElementById('questionInput');
        const responseCard = document.getElementById('responseCard');
        const responseText = document.getElementById('responseText');

        if (questionInput.value.trim() !== '') {
            // Show loading state
            responseText.innerHTML = '<div class="d-flex justify-content-center"><div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div></div>';
            responseCard.classList.add('show');

            // Simulate API call delay
            setTimeout(() => {
                // Get random response for demo
                const randomResponse = sampleResponses[Math.floor(Math.random() * sampleResponses.length)];

                // Display response with typing effect
                typeWriter(responseText, randomResponse, 0, 20);
            }, 1500);
        }
    });

    // New question button
    document.getElementById('newQuestionBtn').addEventListener('click', function() {
        const responseCard = document.getElementById('responseCard');
        const questionInput = document.getElementById('questionInput');

        responseCard.classList.remove('show');
        setTimeout(() => {
            questionInput.value = '';
            questionInput.focus();
        }, 500);
    });

    // Typing effect function
    function typeWriter(element, text, i, speed) {
        if (i < text.length) {
            element.innerHTML = text.substring(0, i + 1) + '<span class="cursor">|</span>';

            setTimeout(() => {
                typeWriter(element, text, i + 1, speed);
            }, speed);
        } else {
            element.innerHTML = text;
            element.classList.add('animate-fadeInUp');
        }
    }
</script>
</body>
</html>