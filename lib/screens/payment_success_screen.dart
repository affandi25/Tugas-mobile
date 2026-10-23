import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/models.dart';
import 'main_nav_screen.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final ProductModel product;
  final ToppingModel? topping;
  final int quantity;
  final int grandTotal;

  const PaymentSuccessScreen({
    super.key,
    required this.product,
    this.topping,
    required this.quantity,
    required this.grandTotal,
  });

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _startPaymentProcess();
  }

  void _startPaymentProcess() async {
    // 1. Simpan pesanan baru ke daftar pesanan dummy agar terhubung dengan My Order
    DummyData.sampleOrders.insert(
      0,
      OrderItemModel(
        product: widget.product,
        toppings: widget.topping != null ? [widget.topping!] : const [],
        quantity: widget.quantity,
        status: 'delivery',
      ),
    );

    // 2. Durasi proses pembayaran sesuai simulasi prototype Figma (1.5 detik)
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _backToHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Warna Latar Hijau Terang Sesuai Figma (#130:1030 & #72:805 - fill_5b472a6b #2ED542)
    return Scaffold(
      backgroundColor: const Color(0xFF2ED542),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: _isLoading ? _buildLoadingView() : _buildSuccessView(),
        ),
      ),
    );
  }

  // Layar 1: Frame #130:1030 ("Pembayaran anda sedang diproses silahkan tunggu.....")
  Widget _buildLoadingView() {
    return Center(
      key: const ValueKey('loading'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Indikator Loading Memutar Sesuai Figma #130:1059
            const SizedBox(
              width: 58,
              height: 58,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 4.5,
              ),
            ),
            const SizedBox(height: 36),

            // Teks Status Pembayaran Sedang Diproses Sesuai Figma #130:1033
            const Text(
              'Pembayaran anda sedang diproses silahkan tunggu.....',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Layar 2: Frame #72:805 ("Pembayaran anda berhasil")
  Widget _buildSuccessView() {
    return Column(
      key: const ValueKey('success'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tombol Panah Kembali di Kiri Atas Sesuai Figma #132:1608
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 12.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black87,
              size: 24,
            ),
            onPressed: _backToHome,
          ),
        ),

        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lingkaran Putih Besar Sesuai Figma #72:806 (180x180 dp)
                  Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFDFD), // Putih bersih sesuai Figma
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x25000000),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    // Centang Sukses Sesuai Figma #172:809 (tick_svgrepo.com)
                    child: const Center(
                      child: Icon(
                        Icons.check_rounded,
                        size: 85,
                        color: Color(0xFF2ED542), // Hijau senada background
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  // Teks "Pembayaran anda berhasil" Sesuai Figma #72:808
                  const Text(
                    'Pembayaran anda berhasil',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Ringkasan Pesanan Singkat
                  Text(
                    'Total Rp ${widget.grandTotal} (${widget.product.name} x${widget.quantity})',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Tombol Kembali ke Beranda
                  SizedBox(
                    width: 220,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF2ED542),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: _backToHome,
                      child: const Text(
                        'Kembali ke Beranda',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
