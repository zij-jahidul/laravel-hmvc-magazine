<!-- Head Libs -->
<script src="{{ asset('public/modules/theme-business/js/vendor/modernizr.min.js') }}"></script>

<!-- Vendor -->
<script src="{{ asset('public/modules/theme-business/js/vendor/jquery.min.js') }}"></script>
<script src="{{ asset('public/modules/theme-business/js/vendor/jquery.appear.min.js') }}"></script>
<script src="{{ asset('public/modules/theme-business/js/vendor/jquery.easing.min.js') }}"></script>
<script src="{{ asset('public/modules/theme-business/js/vendor/jquery.cookie.min.js') }}"></script>
<script src="{{ asset('public/modules/theme-business/js/vendor/bootstrap.bundle.min.js') }}"></script>
{{-- <script src="{{ asset('public/modules/theme-business/js/vendor/jquery.validate.min.js')}}"></script> --}}
{{-- <script src="{{ asset('public/modules/theme-business/js/vendor/jquery.easypiechart.min.js')}}"></script> --}}
{{-- <script src="{{ asset('public/modules/theme-business/js/vendor/jquery.gmap.min.js')}}"></script> --}}
<script src="{{ asset('public/modules/theme-business/js/vendor/lazysizes.min.js') }}"></script>
<script src="{{ asset('public/modules/theme-business/js/vendor/jquery.isotope.min.js') }}"></script>
<script src="{{ asset('public/modules/theme-business/js/vendor/owl.carousel.min.js') }}"></script>
<script src="{{ asset('public/modules/theme-business/js/vendor/jquery.magnific-popup.min.js') }}"></script>
{{-- <script src="{{ asset('public/modules/theme-business/js/vendor/jquery.vide.min.js')}}"></script> --}}
{{-- <script src="{{ asset('public/modules/theme-business/js/vendor/vivus.min.js')}}"></script> --}}

{{-- Parsley Validation JS --}}
<script src="{{ asset('public/assets/common/vendor/parsley/parsley.min.js') }}"></script>

{{-- Axios JS --}}
{{-- <script src="{{ asset('public/assets/common/vendor/axios/axios.min.js')}}"></script> --}}

<!-- Theme Base, Components and Settings -->
<script src="{{ asset('public/modules/theme-business/js/vendor/theme.js') }}"></script>

<!-- Current Page Vendor and Views -->
{{-- <script src="{{ asset('public/modules/theme-business/js/vendor/view.contact.js')}}"></script> --}}


<!-- Demo -->
{{-- <script src="{{ asset('public/modules/theme-business/js/vendor/demo-cleaning-services.js')}}"></script> --}}

<!-- Theme Initialization Files -->
<script src="{{ asset('public/modules/theme-business/js/vendor/theme.init.js') }}"></script>

<script defer="" src="{{ asset('public/modules/theme-business/js/vendor/beacon.min.js') }}"
    data-cf-beacon="{&quot;rayId&quot;:&quot;66c7b7818837d9d4&quot;,&quot;version&quot;:&quot;2021.6.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;03fa3b9eb60b49789931c4694c153f9b&quot;,&quot;si&quot;:10}">
</script>

<!-- Noty JS -->
<script src="{{ asset('public/assets/common/vendor/noty/noty.min.js') }}"></script>
<script src="{{ asset('public/assets/common/vendor/jquery/jquery-3.4.1.min.js') }}"></script>
<script src="{{ asset('public/assets/common/vendor/jquery/bootstrap.min.js') }}"></script>

<script>
    document.body.style.margin = "0px";
</script>

@include('frontend.layouts.partials.flash-messages')

{{-- Any Custom script include in the `scripts` blade section --}}
@yield('scripts')
<script>
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();


    // filter dropdown
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    function filterFunction() {
        var input, filter, ul, li, a, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        div = document.getElementById("myDropdown");
        a = div.getElementsByTagName("a");
        for (i = 0; i < a.length; i++) {
            txtValue = a[i].textContent || a[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                a[i].style.display = "";
            } else {
                a[i].style.display = "none";
            }
        }
    }
</script>


@yield('scripts')
