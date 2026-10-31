# RecipeHub – Defect Log

| Defect ID | Issue | Cause | Resolution | Status |
|---|---|---|---|---|
| D001 | Recipes could not load on the physical Android phone. | Android Internet permission was missing from AndroidManifest.xml. | Added the INTERNET permission to AndroidManifest.xml and rebuilt the release APK. | Fixed |
| D002 | No additional confirmed defects recorded. | — | — | — |

## Verification

- Flutter analysis: Passed (`flutter analyze`)
- Flutter tests: Passed (`flutter test`)
- Release APK: Built successfully.
- Physical Android phone: App installed and tested successfully after the Internet permission fix.

