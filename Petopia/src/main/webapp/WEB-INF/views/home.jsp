<div>
<section>
메인 이미지 1
</section>
<section class="swiper-container">
  <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
        <img src="../images/Main_01_01.png" width=100%/>
        </div>
        <div class="swiper-slide">
        <img src="../images/Main_01_02.jpg" width=100%/>
        </div>
        <div class="swiper-slide">
        <img src="../images/Main_01_03.jpg" width=100%/>
        </div>
        <div class="swiper-slide">
        <img src="../images/Main_01_04.png" width=100%/>
        </div>
      </div>
      <div class="swiper-pagination"></div>
    </div>
</section>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
      var swiper = new Swiper(".mySwiper", {
        pagination: {
          el: ".swiper-pagination",
        },
      });
</script>
</div>

