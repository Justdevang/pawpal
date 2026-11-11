# PawPal - Store Listing Assets Guide

## App Icons

### Android (Play Store)
- **Adaptive Icon**: 1024x1024px (foreground 648x648px, background 1024x1024px)
- **Legacy Icon**: 512x512px
- **Round Icon**: 512x512px
- **Format**: PNG with transparency

### iOS (App Store)
- **App Icon**: 1024x1024px (no transparency, no rounded corners)
- **Format**: PNG

### Design Specifications
- **Background**: Deep Maroon (#6B0F0A)
- **Foreground**: Orange Paw (#E8812B)
- **Style**: Rounded geometric paw icon centered
- **Safe Zone**: 20% padding from edges

### Sizes Required
| Platform | Size | Usage |
|----------|------|-------|
| Android | 48x48 | Launcher |
| Android | 72x72 | Launcher (hdpi) |
| Android | 96x96 | Launcher (xhdpi) |
| Android | 144x144 | Launcher (xxhdpi) |
| Android | 192x192 | Launcher (xxxhdpi) |
| Android | 512x512 | Play Store |
| iOS | 20x20 | Notification |
| iOS | 29x29 | Settings |
| iOS | 40x40 | Spotlight |
| iOS | 60x60 | App Icon |
| iOS | 76x76 | iPad App Icon |
| iOS | 83.5x83.5 | iPad Pro |
| iOS | 1024x1024 | App Store |

## Splash Screens

### Android
- **Launch Screen**: 1080x1920px (portrait)
- **Background**: Cream (#FFF6EE)
- **Logo**: Centered PawPal logo with "PawPal" wordmark
- **Animation**: Fade in + scale up (800ms)

### iOS
- **Launch Screen**: 1125x2436px (iPhone X+)
- **Background**: Cream (#FFF6EE)
- **Logo**: Centered PawPal logo
- **Safe Area**: Respect notch/Dynamic Island

## Screenshots

### Required Sizes
| Device | Size | Orientation |
|--------|------|-------------|
| Phone (6.7") | 1290x2796 | Portrait |
| Phone (6.5") | 1242x2688 | Portrait |
| Phone (5.5") | 1242x2208 | Portrait |
| iPad Pro (12.9") | 2048x2732 | Portrait |
| Android 7" | 1080x1920 | Portrait |
| Android 10" | 1600x2560 | Portrait |

### Screenshots Required (8-10 per platform)
1. **Onboarding** - Hero dog, headline, CTA
2. **Dashboard** - Two-tone header, pet carousel, task cards, health summary
3. **Pet Profile** - Hero photo, stat tiles, health records
4. **Vaccinations** - List with status badges, add form
5. **Medications** - List with frequency, log dose action
6. **Reminders** - Overdue/upcoming sections
7. **Services** - Grid with Vet/Weight enabled
8. **Settings** - Sections with toggles
9. **Dark Mode** - Dashboard in dark theme
10. **Family Sharing** - Invite flow

### Screenshot Guidelines
- Use real pet photos (not placeholder)
- Show populated data (not empty states)
- Include status badges (overdue/due soon)
- Show PawPal branding consistently
- Test on both light/dark themes

## Feature Graphic (Google Play)
- **Size**: 1024x500px
- **Background**: Cream to Terracotta gradient
- **Content**: Logo + "PawPal" + "Your Pet Care Companion"
- **Style**: Clean, minimal, readable at small sizes

## App Store Preview Video (Optional)
- **Duration**: 15-30 seconds
- **Format**: MP4, 1080p
- **Content**: Key flows demo
- **Poster Frame**: Feature graphic

## Privacy Policy
- **URL**: https://pawpal.app/privacy
- **Required Sections**:
  - Data collected (personal, pet, health)
  - Data usage (sync, reminders, analytics)
  - Data sharing (family, vets, never sold)
  - User rights (access, deletion, portability)
  - Children's privacy (COPPA)
  - Security measures
  - Contact information

## App Store Description

### Short Description (80 chars)
**Track vaccinations, medications & vet visits for all your pets in one beautiful app.**

### Long Description (4000 chars)
```
PawPal helps pet parents never miss a vaccination, deworming, or medicine dose again. 

🐾 MULTI-PET SUPPORT
Create profiles for all your pets - dogs, cats, rabbits, and more. Switch between them instantly with the pet carousel.

💉 VACCINATION TRACKER
Pre-loaded vaccine schedules for dogs & cats (Rabies, DHPP, FVRCP, FeLV, etc.). Auto-calculates next due dates. Export PDF records for vet visits, boarding, or travel.

💊 MEDICATION REMINDERS
Flexible scheduling: daily, twice daily, every N hours, specific weekdays, or custom. Get notifications with "Given/Snooze/Skip" actions. Track adherence streaks and get refill alerts.

🏥 VET APPOINTMENTS
Book and manage vet visits with clinic details, maps, and reminders. Syncs with family members.

⚖️ WEIGHT TRACKER
Log weight entries, view growth charts, and track trends (gaining/losing/stable).

👨‍👩‍👧‍👦 FAMILY SHARING
Invite partners, pet sitters, or family. Choose permissions: Owner, Editor, or Viewer. Shared reminders sync in real-time.

🌙 DARK MODE & ACCESSIBILITY
Full dark mode support, reduce motion, high contrast, large text, screen reader optimized.

☁️ OFFLINE-FIRST & SECURE
All data stored locally first, syncs to cloud when online. End-to-end encryption. GDPR/CCPA compliant.

Download PawPal today and give your pets the care they deserve!
```

## Keywords (App Store)
pets, pet care, vaccination, medication, reminder, vet, health tracker, dog, cat, multi-pet, family sharing

## Promotional Text (170 chars)
**New: Family sharing & weight tracker! Invite family to co-manage pet care. Track weight trends with beautiful charts.**

## Release Notes Template
```
Version X.Y.Z

✨ New Features
- [Feature 1]
- [Feature 2]

🐛 Bug Fixes
- [Fix 1]
- [Fix 2]

🎨 Improvements
- [Improvement 1]
```

## Versioning
- **Format**: MAJOR.MINOR.PATCH (e.g., 1.2.3)
- **Build Number**: Increment for each upload
- **Pre-release**: 1.0.0-beta.1, 1.0.0-rc.1

## Submission Checklist

### Before Submission
- [ ] All tests pass (flutter test, integration_test)
- [ ] Analyze passes (flutter analyze)
- [ ] Icons generated for all sizes
- [ ] Splash screens created
- [ ] Screenshots captured (light + dark)
- [ ] Feature graphic created
- [ ] Privacy policy hosted
- [ ] App Store Connect / Play Console configured
- [ ] In-app purchases configured (if applicable)
- [ ] TestFlight / Internal Testing completed
- [ ] Release notes written
- [ ] Version/Build number incremented
- [ ] Signing keys backed up
- [ ] Crashlytics / Analytics verified

### Post-Launch
- [ ] Monitor crash reports (24-48h)
- [ ] Check analytics events
- [ ] Respond to reviews
- [ ] Monitor performance metrics
- [ ] Plan hotfix if needed