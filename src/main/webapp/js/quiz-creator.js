document.addEventListener('DOMContentLoaded', function() {
    const addTagBtn = document.getElementById('add-tag-btn');
    const addTagInput = document.getElementById('add-tag-input');
    const quizTags = document.getElementById('quiz-tags');
    const addQuestionBtn = document.getElementById('add-question-btn');
    const quizQuestions = document.getElementById('quiz-questions');

    addTagBtn.addEventListener('click', function() {
        const tagText = addTagInput.value.trim();
        if (tagText) {
            addTag(tagText);
            addTagInput.value = '';
        }
    });

    function addTag(text) {
        const tag = document.createElement('span');
        tag.className = 'tag';
        tag.innerHTML = `
      ${text}
      <button type="button" onclick="this.parentElement.remove();">&times;</button>
      <input type="hidden" name="quizTags" value="${text}">
    `;
        quizTags.appendChild(tag);
    }

    let questionCount = 0;
    addQuestionBtn.addEventListener('click', function() {
        questionCount++;
        const questionDiv = document.createElement('div');
        questionDiv.innerHTML = `
      <h3>Question ${questionCount}</h3>
      <input type="text" name="question${questionCount}" placeholder="Enter question" required>
      <input type="text" name="answer${questionCount}" placeholder="Enter answer" required>
    `;
        quizQuestions.appendChild(questionDiv);
    });
});