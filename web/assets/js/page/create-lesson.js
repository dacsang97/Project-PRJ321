new Vue({
  el: "#create-lesson",
  data() {
    return {
      title: "",
      type: 3,
      quizStr: "",
      shareType: ["Chỉ mình tôi", "Thành viên", "Công khai"],
      quizzes: [
        { question: "", answer: "" },
        { question: "", answer: "" },
        { question: "", answer: "" }
      ],
      error: false,
      quizCount: 3
    };
  },
  updated() {
    if (this.quizzes.length > this.quizCount) {
      window.scrollTo(0, document.body.scrollHeight);
      this.quizCount = this.quizzes.length;
    }
  },
  methods: {
    onSubmit() {
      if (this.title === "") {
        this.error = true;
      } else {
        this.error = false;
      }
      if (!this.error) {
        this.quizStr = JSON.stringify(this.quizzes);
        var params = new URLSearchParams();
        params.append("quizzesTemp", JSON.stringify(this.quizzes));
        params.append("title", this.title);
        params.append("share", this.type);
        axios
          .post("./CreateLessonAction", params)
          .then(response => {
            // console.log(response);
            swal("Chúc mừng bạn vừa tạo xong bài học.").then(value => {
              location.href = `./Lesson.jsp?lid=${response.headers.lid}`;
            });
          })
          .catch(err => {
            console.log(err);
          });
      }
    },
    onAddQuestion() {
      this.quizzes.push({ question: "", answer: "" });
    },
    onRemoveQuestion(index) {
      this.quizzes.splice(index, 1);
    }
  }
});
