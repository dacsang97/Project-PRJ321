new Vue({
  el: "#edit-lesson",
  data() {
    return {
      type: type,
      title: title,
      shareType: ["Chỉ mình tôi", "Thành viên", "Công khai"],
      error: false,
      quizzes: quizzes,
      quizStr: "",
      lid: lid,
      quizCount: quizzes.length
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
        params.append("lid", this.lid);
        axios
          .post("./EditLessonAction", params)
          .then(response => {
            // console.log(response);
            swal("Bài học của bạn đã được cập nhật.").then(value => {
              location.href = `./Lesson.jsp?lid=${response.headers.lid}`;
            });
          })
          .catch(err => {
            console.log(err);
          });
      }
    },
    onAddQuestion() {
      this.quizzes.splice(this.quizzes.length, 0, { question: "", answer: "" });
      //   this.quizzes.push({ question: "", answer: "" });
    },
    onRemoveQuestion(index) {
      this.quizzes.splice(index, 1);
    }
  }
});
