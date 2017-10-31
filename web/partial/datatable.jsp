<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Required datatable js -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap4.min.js"></script>
<!-- Responsive examples -->
<script src="assets/plugins/datatables/dataTables.responsive.min.js"></script>
<script src="assets/plugins/datatables/responsive.bootstrap4.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#datatable').DataTable({
            language: {
                "processing": "Đang xử lý...",
                "lengthMenu": "Xem _MENU_ mục",
                "zeroRecords": "Không tìm thấy dòng nào phù hợp",
                "info": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "infoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                "infoFiltered": "(được lọc từ _MAX_ mục)",
                "infoPostFix": "",
                "search": "Tìm:",
                "url": "",
                "paginate": {
                    "first": "Đầu",
                    "previous": "Trước",
                    "next": "Tiếp",
                    "last": "Cuối"
                }
            }
        });
    });

</script>


