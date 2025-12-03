import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../widgets/common/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Decorative Patterns (Top Left)
          Positioned(
            top: -30,
            left: -50,
            child: SvgPicture.asset(
              'assets/componets svg vertor/six.svg',
              width: 200,
              height: 150,
              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          ),
          
          Positioned(
            bottom: 100,
            left: -65,
            child: SvgPicture.asset(
              'assets/componets svg vertor/forth.svg',
              width: 131,
              height: 131,
            
            ),
          ),

          Positioned(
            top: 100,
            right: -65,
            child: Transform.rotate(
              angle: 3.14159, // 180 degrees
              child: SvgPicture.asset(
                'assets/componets svg vertor/forth.svg',
                width: 131,
                height: 131,
                
              ),
            ),
          ),
          // Decorative Patterns (Bottom Right)
          Positioned(
            bottom: -10,
            right: -5,
            child: Transform.rotate(
              angle: 0.2, // 180 degrees
              child: SvgPicture.asset(
                'assets/componets svg vertor/six.svg',
                width: 200,
                height: 150,
                colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    Center(
                      child: Text(
              'هەوری',
              style: TextStyle(
                fontFamily: 'UniMahanNurhan',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
                    ),
                    const SizedBox(height: 40),
                    
                    Text(
                      'Sign in to your\nAccount',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ).animate().fadeIn().slideX(),
                    
                    const SizedBox(height: 8),
                    Text(
                      'Enter your email and password to log in',
                      style: TextStyle(color: Colors.grey),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    CustomTextField(
                      label: 'Email',
                      hint: 'email@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      label: 'Password',
                      obscureText: true,
                      hint: '••••••••',
                    ),
                    
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    ElevatedButton(
                      onPressed: () => context.go('/home'),
                      child: const Text(
                        'Log In',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey[300])),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Or', style: TextStyle(color: Colors.grey)),
                        ),
                        Expanded(child: Divider(color: Colors.grey[300])),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Social Login Buttons
                    _SocialLoginButton(
                      icon: 'assets/icons/Google.svg',
                      label: 'Continue with Google',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    _SocialLoginButton(
                      icon: 'assets/icons/Facebook.svg',
                      label: 'Continue with Facebook',
                      onPressed: () {},
                      iconColor: const Color(0xFF1877F2), // Facebook Blue
                    ),
                    
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
          
          // Sign Up Link Pinned to Bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () => context.push('/register'),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onPressed;
  final Color? iconColor;

  const _SocialLoginButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: iconColor != null 
              ? ColorFilter.mode(iconColor!, BlendMode.srcIn) 
              : null,
        ),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: BorderSide(color: Colors.grey[300]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
