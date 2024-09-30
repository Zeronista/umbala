document.addEventListener('DOMContentLoaded', function () {
    const addQuestionBtn = document.getElementById('add-question-btn');
    const quizQuestionsDiv = document.getElementById('quiz-questions');

    let questionCount = 0;

    addQuestionBtn.addEventListener('click', function () {
        questionCount++;
        const questionHTML = `
            <div class="quiz-question">
                <label for="question-${questionCount}">Question ${questionCount}:</label>
                <input type="text" id="question-${questionCount}" name="question-${questionCount}" required>
                <label for="answer-${questionCount}">Answer:</label>
                <input type="text" id="answer-${questionCount}" name="answer-${questionCount}" required>
            </div>
        `;
        quizQuestionsDiv.insertAdjacentHTML('beforeend', questionHTML);
    });
});
