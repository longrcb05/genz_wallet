import 'package:flutter/material.dart';

void main() {
  runApp(const GenZFinanceApp());
}

class GenZFinanceApp extends StatelessWidget {
  const GenZFinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gen Z Finance',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF141416),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6B9BFA),
          surface: Color(0xFF222226),
        ),
        useMaterial3: true,
      ),
      home: const MainLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// =====================================================================
// KHUNG ĐIỀU HƯỚNG CHÍNH (BOTTOM NAVIGATION)
// =====================================================================
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    StatsScreen(),
    SocialScreen(),
    BudgetScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF141416),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFF6B9BFA),
          unselectedItemColor: Colors.grey.shade600,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Trang chủ'),
            BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Thống kê'),
            BottomNavigationBarItem(icon: Icon(Icons.diversity_3), label: 'Cộng đồng'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Ngân sách'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cá nhân'),
          ],
        ),
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
        onPressed: () => _showAddExpenseBottomSheet(context),
        backgroundColor: const Color(0xFF6B9BFA),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      )
          : null,
    );
  }

  void _showAddExpenseBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF222226),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 24, right: 24, top: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Thêm khoản chi 💸', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFFF5B5B)),
              decoration: InputDecoration(
                hintText: '0đ',
                hintStyle: TextStyle(color: Colors.grey.shade700),
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.remove_circle_outline, color: Color(0xFFFF5B5B)),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Chi cho việc gì thế? (VD: Mua giáo trình DTU)',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                border: InputBorder.none,
                icon: const Icon(Icons.edit_note, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildActionChip(Icons.emoji_emotions, 'Cảm xúc', Colors.orange),
                const SizedBox(width: 12),
                _buildActionChip(Icons.camera_alt, 'Chụp ảnh', Colors.blue),
                const SizedBox(width: 12),
                _buildActionChip(Icons.group, 'Chia nhóm', Colors.purple),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B9BFA),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Lưu khoản chi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildActionChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// =====================================================================
// 1. TRANG CHỦ (HOME)
// =====================================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chào buổi chiều 🌤️', style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
                    const Text('Nhật Long', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFF20D07B).withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                      child: const Text('🔥 Streak: 12 ngày liên tiếp', style: TextStyle(color: Color(0xFF20D07B), fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const CircleAvatar(radius: 24, backgroundColor: Color(0xFF222226), child: Icon(Icons.person, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Ngày', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    children: [Text('Tháng', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), SizedBox(width: 4), Icon(Icons.grid_view, size: 14)],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildSummaryCard('Chi', '15,000đ', const Color(0xFFFF5B5B), Icons.call_made)),
                const SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('Thu', '0đ', const Color(0xFF20D07B), Icons.call_received)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildFilterChip('Tất cả', isSelected: true),
                const SizedBox(width: 8),
                _buildFilterChip('Wallet'),
                const SizedBox(width: 8),
                _buildFilterChip('Bank'),
              ],
            ),
            const SizedBox(height: 24),
            const Center(child: Text('<    tháng 4 2026    >', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Text('Giao diện Lịch (Calendar) hiển thị ở đây\n(Giống ảnh 3)', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String amount, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          CircleAvatar(radius: 12, backgroundColor: color.withOpacity(0.2), child: Icon(icon, size: 14, color: color)),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(title, style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF6B9BFA) : const Color(0xFF222226),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}

// =====================================================================
// 2. THỐNG KÊ (STATS)
// =====================================================================
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Expanded(child: Center(child: Text('Tháng', style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold)))),
                  Expanded(child: Center(child: Text('Năm', style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold)))),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(color: const Color(0xFF6B9BFA), borderRadius: BorderRadius.circular(20)),
                      child: const Center(child: Text('Tất cả', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildFilterChip('Tất cả', isSelected: true),
                const SizedBox(width: 8),
                _buildFilterChip('Wallet'),
                const SizedBox(width: 8),
                _buildFilterChip('Bank'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        CircleAvatar(radius: 12, backgroundColor: const Color(0xFF20D07B).withOpacity(0.2), child: const Icon(Icons.call_received, size: 14, color: Color(0xFF20D07B))),
                        const SizedBox(width: 8),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Thu nhập', style: TextStyle(color: Colors.grey.shade400, fontSize: 10)), const Text('0đ', style: TextStyle(fontWeight: FontWeight.bold))]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFFF5B5B).withOpacity(0.3))),
                    child: Row(
                      children: [
                        CircleAvatar(radius: 12, backgroundColor: const Color(0xFFFF5B5B).withOpacity(0.2), child: const Icon(Icons.call_made, size: 14, color: Color(0xFFFF5B5B))),
                        const SizedBox(width: 8),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Chi tiêu', style: TextStyle(color: Color(0xFFFF5B5B), fontSize: 10)), const Text('15,000đ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF5B5B)))]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Số dư', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                  const SizedBox(height: 4),
                  const Text('-15,000đ', style: TextStyle(color: Color(0xFFFF5B5B), fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 180, height: 180,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF4CAF50), width: 25)),
                      ),
                      const Column(
                        children: [
                          Text('Chi tiêu', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          Text('15,000đ', style: TextStyle(color: Color(0xFFFF5B5B), fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('1 Danh mục', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const CircleAvatar(backgroundColor: Color(0xFF4CAF50), child: Icon(Icons.shopping_cart, color: Colors.white)),
                        const SizedBox(width: 12),
                        const Text('Ăn uống', style: TextStyle(fontWeight: FontWeight.bold)),
                        const Spacer(),
                        const Text('15,000đ', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 12),
                        const Text('100%', style: TextStyle(color: Color(0xFF4CAF50))),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: isSelected ? const Color(0xFF6B9BFA) : const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}

// =====================================================================
// 3. CỘNG ĐỒNG (SOCIAL & GROUPS)
// =====================================================================
class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: TabBar(
                indicatorColor: Color(0xFF6B9BFA),
                labelColor: Color(0xFF6B9BFA),
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,
                tabs: [Tab(text: '🌐 Feed Bạn Bè'), Tab(text: '🤝 Nhóm Trả Tiền')],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildPost('Anh Dui', 'Vừa xong', 'Cà phê sáng chốt task tuần này ☕', '45,000đ', '5'),
                      _buildPost('Hội Mỏ Hỗn', '2 giờ trước', 'Đi du lịch Đà Nẵng cực cháy! 🌊', '2,500,000đ', '32'),
                    ],
                  ),
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildGroupCard('Trọ Đà Nẵng', 'Bạn cần trả: 1,200k', const Color(0xFFFF5B5B)),
                      _buildGroupCard('Quỹ Team Đi Phượt', 'Đang dư: 500k', const Color(0xFF20D07B)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPost(String name, String time, String content, String amount, String likes) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.grey.shade800, child: Text(name[0])),
              const SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.bold)), Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12))]),
              const Spacer(),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFFF5B5B).withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: Text('- $amount', style: const TextStyle(color: Color(0xFFFF5B5B), fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 12),
          Text(content),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.favorite_border, color: Colors.grey, size: 20), const SizedBox(width: 4), Text(likes, style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 20), const SizedBox(width: 4), const Text('Bình luận', style: TextStyle(color: Colors.grey)),
              const Spacer(),
              const Icon(Icons.auto_awesome, color: Color(0xFF6B9BFA), size: 16), const SizedBox(width: 4), const Text('AI Caption', style: TextStyle(color: Color(0xFF6B9BFA), fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildGroupCard(String title, String status, Color statusColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: Color(0xFF6B9BFA), child: Icon(Icons.group, color: Colors.white)),
          const SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const SizedBox(height: 4), Text(status, style: TextStyle(color: statusColor, fontSize: 12))]),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}

// =====================================================================
// 4. NGÂN SÁCH (BUDGET)
// =====================================================================
class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Quản lý ngân sách', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Tạo và theo dõi nhiều ngân sách', style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  CircleAvatar(backgroundColor: const Color(0xFF6B9BFA).withOpacity(0.2), child: const Icon(Icons.add, color: Color(0xFF6B9BFA))),
                  const SizedBox(width: 16),
                  const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Thêm ngân sách mới', style: TextStyle(fontWeight: FontWeight.bold)), Text('Tạo ngân sách tổng hoặc theo danh mục', style: TextStyle(color: Colors.grey, fontSize: 11))]),
                  const Spacer(),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Icon(Icons.account_balance_wallet_outlined, size: 48, color: Colors.grey.shade700),
                  const SizedBox(height: 16),
                  const Text('Chưa có ngân sách', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Tạo ngân sách để theo dõi chi tiêu', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// 5. CÁ NHÂN (PROFILE)
// =====================================================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    Container(
                      width: 80, height: 80,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.pinkAccent.withOpacity(0.5), width: 2)),
                      child: const Center(child: Text('L', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
                    ),
                    const SizedBox(height: 12),
                    const Text('longrcb05', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.grey.shade800, borderRadius: BorderRadius.circular(8)),
                      child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.calendar_month, size: 12, color: Colors.grey), SizedBox(width: 4), Text('thg 4 2026', style: TextStyle(color: Colors.grey, fontSize: 10))]),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Tổng quan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.8,
              children: [
                _buildGridCard(Icons.compare_arrows, 'Giao dịch', '1', Colors.white),
                _buildGridCard(Icons.arrow_downward, 'Tổng thu nhập', '0đ', const Color(0xFF20D07B)),
                _buildGridCard(Icons.arrow_upward, 'Tổng chi tiêu', '15,000đ', const Color(0xFFFF5B5B)),
                _buildGridCard(Icons.pie_chart, 'Số dư', '-15,000đ', const Color(0xFFFF5B5B)),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const Icon(Icons.stars, color: Colors.grey, size: 32),
                  const SizedBox(width: 12),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Nâng cấp', style: TextStyle(fontWeight: FontWeight.bold)), Text('Mở khóa tất cả tính năng cao cấp', style: TextStyle(color: Colors.grey, fontSize: 11))])),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    child: const Text('Nâng cấp', style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const Icon(Icons.apple, size: 32),
                  const SizedBox(width: 12),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Đăng nhập với Apple', style: TextStyle(fontWeight: FontWeight.bold)), Text('Liên kết tài khoản để sao lưu', style: TextStyle(color: Colors.grey, fontSize: 11))])),
                  const Icon(Icons.chevron_right, color: Colors.grey)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridCard(IconData icon, String title, String value, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF222226), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: iconColor),
              const SizedBox(width: 6),
              Text(title, style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: iconColor)),
        ],
      ),
    );
  }
}