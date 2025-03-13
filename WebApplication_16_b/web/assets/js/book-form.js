$(document).ready(function () {
    // Hiển thị tên file khi chọn file
    $('#imageUpload').change(function () {
        const file = this.files[0];
        if (file) {
            // Kiểm tra xem file có phải là hình ảnh không
            if (!file.type.match('image.*')) {
                alert('Please select an image file (JPEG, PNG, GIF, etc.)');
                this.value = '';
                $('#fileInfo').text('No file selected');
                return;
            }

            // Hiển thị tên file và kích thước
            const fileSize = (file.size / 1024).toFixed(2) + ' KB';
            $('#fileInfo').text(file.name + ' (' + fileSize + ')');

            // Hiển thị thanh tiến trình và bắt đầu chuyển đổi sang Base64
            $('#progressContainer').show();

            // Thiết lập FileReader để đọc file và chuyển đổi sang Base64
            const reader = new FileReader();

            reader.onprogress = function (event) {
                if (event.lengthComputable) {
                    const percentLoaded = Math.round((event.loaded / event.total) * 100);
                    $('#progressBar').css('width', percentLoaded + '%');
                }
            };

            reader.onload = function (e) {
                // Hoàn thành tiến trình
                $('#progressBar').css('width', '100%');

                // Lưu trữ dữ liệu Base64 vào input ẩn
                const base64String = e.target.result;
                $('#txtImage').val(base64String);

                // Hiển thị hình ảnh xem trước
                $('#imagePreview').html('<img src="' + base64String + '" alt="Preview">');

                // Ẩn thanh tiến trình sau 1 giây
                setTimeout(function () {
                    $('#progressContainer').hide();
                    $('#progressBar').css('width', '0%');
                }, 1000);
            };

            reader.onerror = function () {
                alert('Error reading the file. Please try again.');
                $('#progressContainer').hide();
                $('#progressBar').css('width', '0%');
                $('#fileInfo').text('No file selected');
            };

            // Bắt đầu đọc file và chuyển đổi sang Base64
            reader.readAsDataURL(file);
        } else {
            $('#fileInfo').text('No file selected');
        }
    });

    // Xử lý nút Reset
    $('#resetBtn').click(function () {
        $('#imagePreview').empty();
        $('#fileInfo').text('No file selected');
        $('#txtImage').val('');
        $('#progressContainer').hide();
        $('#progressBar').css('width', '0%');
    });

    // Để chọn lại file đã tải lên trước đó (nếu có)
    const existingImageSrc = $('#imagePreview img').attr('src');
    if (existingImageSrc) {
        $('#txtImage').val(existingImageSrc);
    }
});