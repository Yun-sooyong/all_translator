# 3_translator (가제)

한국에서 가장 많이 사용하는 번역기인 구글, 카카오, 파파고 번역기 API 를 사용하여 만든 번역기 앱

첫 완성 직전인 Flutter로 만든 개인 프로젝트

한 번의 입력으로 동시에 3개의 번역기를 실행하여 결과를 볼 수 있음 

## 사용 API
 - 카카오 번역 API
 - 파파고 번역 API 
 - 구글 Cloud Translation API 

## 번역기별 지원 언어
 - [파파고](https://developers.naver.com/docs/papago/papago-nmt-api-reference.md)
 - [카카오](https://developers.kakao.com/docs/latest/ko/translate/common#language)
 - [구글](https://cloud.google.com/translate/docs/languages?hl=ko)

## 지원 언어에 관하여
 - 구글 번역기가 가장 많은 언어를 지원하며 파파고가 가장 적은 언어를 지원 (구글: 108개, 카카오: 20개, 파파고 13개)
 
 - 파파고 : 번역할 수 있는 시작언어와 타겟언어가 이미 정해져있음 
 - 카카오 : 지원 언어의 코드가 다른 번역기와 다른 경우가 존재 (ko/kr, jp/ja, 중국어의 경우 번체,간체를 구분하지 않고 ch로 통일)
 - 구글 : Cloud Translation API 에 언어 감지 기능이 포함이 되어있음 


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

