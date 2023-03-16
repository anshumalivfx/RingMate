//
//  ChatViewModifiers.swift
//  RingMate
//
//  Created by Anshumali Karna on 16/03/23.
//


import SwiftUI

struct TabImageModifier: ViewModifier {
  
  var isSelected: Bool
  
  func body(content: Content) -> some View {
    return content
      .font(.system(size: 16, weight: .semibold))
      .foregroundColor(isSelected == true ? .primary: .gray)
  }
}

struct TabTitleModifier: ViewModifier {
  
  var isSelected: Bool
  
  func body(content: Content) -> some View {
    return content
      .font(.system(size: 11, weight: .semibold))
      .foregroundColor(isSelected == true ? .primary : .gray)
  }
}

struct TabButtonModifier: ViewModifier {
  
  var isSelected: Bool
  
  func body(content: Content) -> some View {
    return content
      .padding(.vertical, 8)
      .frame(width: 70)
      .contentShape(Rectangle())
      .background(Color.primary.opacity(isSelected == true ? 0.15 : 0))
      .cornerRadius(10)
  }
}

extension Image {
  func tabImage(isSelected: Bool) -> some View {
    return self.modifier(TabImageModifier(isSelected: isSelected))
  }
}

extension Text {
  func tabTitle(isSelected: Bool) -> some View {
    return self.modifier(TabTitleModifier(isSelected: isSelected))
  }
}

extension View {
  func tabButton(isSelected: Bool) -> some View {
    return self.modifier(TabButtonModifier(isSelected: isSelected))
  }
}

struct IconButtonModifier: ViewModifier {
  
  func body(content: Content) -> some View {
    return content
      .font(.title2)
  }
}

struct TextBoxModifier: ViewModifier {
  
  func body(content: Content) -> some View {
    return content
      .padding(.vertical, 8)
      .padding(.horizontal)
      .background(Color.primary.opacity(0.1))
      .cornerRadius(10)
  }
}

extension View {
  func iconButton() -> some View {
    return self.modifier(IconButtonModifier())
  }
  
  func searchBar() -> some View {
    return self.modifier(TextBoxModifier())
  }
  
  func inputBar() -> some View {
  return self.modifier(TextBoxModifier())
  }
}

struct ProfileImageModifier: ViewModifier {
  
  var size: CGFloat = 40
  
  func body(content: Content) -> some View {
    return content
      .frame(width: size, height: size)
      .background(Color(.systemGray).opacity(0.4))
      .clipShape(Circle())
  }
}

extension Image {
  func profileImage(size: CGFloat = 40) -> some View {
    return self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .modifier(ProfileImageModifier())
  }
}

struct IncomingMessageBubbleModfier: ViewModifier {
  
  func body(content: Content) -> some View {
    return content
      .foregroundColor(.primary)
      .padding(10)
      .background(Color.primary.opacity(0.1))
      .clipShape(MessageBubble())
  }
}

// Message Bubble...
struct MessageBubble: Shape {
  
  func path(in rect: CGRect) -> Path {
    return Path { path in
      let pt1 = CGPoint(x: 0, y: 0)
      let pt2 = CGPoint(x: rect.width, y: 0)
      let pt3 = CGPoint(x: rect.width, y: rect.height)
      let pt4 = CGPoint(x: 0, y: rect.height)
      
      path.move(to: pt4)
      
      path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 15)
      path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 15)
      path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 15)
      path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 15)
    }
  }
}


struct OutgoingMessageBubbleModfier: ViewModifier {
  
  func body(content: Content) -> some View {
    return content
      .foregroundColor(.white)
      .padding(10)
      .background(Color.blue)
      .cornerRadius(15)
  }
}

extension View {
  func messageBubble(incoming: Bool) -> some View {
    if incoming == true {
      return AnyView(self.modifier(IncomingMessageBubbleModfier()))
    } else {
      return AnyView(self.modifier(OutgoingMessageBubbleModfier()))
    }
  }
}
