import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../widgets/common/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    const SizedBox(height: 32),
                    
                    Text(
                      'Create an account to\ncontinue!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ).animate().fadeIn().slideX(),
                    
                    const SizedBox(height: 32),
                    
                    CustomTextField(
                      label: 'Full Name',
                      hint: 'Enter your full name',
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      label: 'Email',
                      hint: 'email@domain.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    
                    // Date of Birth (Simplified for now)
                    CustomTextField(
                      label: 'Birth of date',
                      hint: 'Select Date',
                      suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    
                    // Phone Number (Simplified)
                    CustomTextField(
                      label: 'Phone Number',
                      hint: '+964 750 000 0000',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      label: 'Set Password',
                      obscureText: true,
                      hint: '••••••••',
                      suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    ElevatedButton(
                      onPressed: () => context.go('/home'),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ", style: TextStyle(color: Colors.grey)),
                        GestureDetector(
                          onTap: () => context.go('/login'),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
