new Vue({
  el: "#create-folder",
  components: {},
  data() {
    return {
      title: "",
      type: 3,
      shareType: ["Chỉ mình tôi", "Thành viên", "Công khai"],
      currentList: [],
      remainList: lessons,
      error: false,
      list: [
        {
          name: "John"
        },
        {
          name: "Joao"
        },
        {
          name: "Jean"
        }
      ],
      list2: [
        {
          name: "Juan"
        },
        {
          name: "Edgard"
        },
        {
          name: "Johnson"
        }
      ]
    };
  },
  computed: {
    dragOptions() {
      return {
        animation: 0,
        group: "description",
        ghostClass: "ghost"
      };
    }
  },
  created() {
    this.currentList = this.currentList.map(item => ({
      ...item,
      key: faker.name.findName()
    }));
    this.remainList = this.remainList.map(item => ({
      ...item,
      key: faker.name.findName()
    }));
  },
  methods: {
    onSubmit() {
      if (this.title === "") {
        this.error = true;
      } else {
        this.error = false;
      }
      if (!this.error) {
        // this.quizStr = JSON.stringify(this.quizzes);
        // var params = new URLSearchParams();
        // params.append("quizzesTemp", JSON.stringify(this.quizzes));
        // params.append("title", this.title);
        // params.append("share", this.type);
        // axios
        //   .post("./CreateLessonAction", params)
        //   .then(response => {
        //     // console.log(response);
        //     swal("Chúc mừng bạn vừa tạo xong bài học.").then(value => {
        //       location.href = `./Lesson.jsp?lid=${response.headers.lid}`;
        //     });
        //   })
        //   .catch(err => {
        //     console.log(err);
        //   });
      }
    }
  }
});
