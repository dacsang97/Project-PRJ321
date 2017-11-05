new Vue({
  el: "#create-folder",
  components: {},
  data() {
    return {
      fid: fid,
      title: title,
      type: type,
      shareType: ["Chỉ mình tôi", "Thành viên", "Công khai"],
      currentList: currentArr,
      remainList: lessons,
      error: {},
      submited: false,
      lessons: ""
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
      this.error = {
        title: false,
        list: false
      };
      this.submited = true;
      if (this.title === "") {
        this.error.title = true;
      }
      if (this.currentList.length === 0) {
        this.error.list = true;
      }
      if (!this.error.title && !this.error.list) {
        var params = new URLSearchParams();
        params.append("lessonsTemp", JSON.stringify(this.currentList));
        params.append("name", this.title);
        params.append("sharefolder", this.type);
        params.append("fid", this.fid);
        axios
          .post("./EditFolderAction", params)
          .then(response => {
            swal("Chuyên mục của bạn đã được cập nhật.").then(value => {
              location.href = `./Folder.jsp?fid=${response.headers.fid}`;
            });
          })
          .catch(err => {
            console.log(err);
          });
      }
    }
  }
});
