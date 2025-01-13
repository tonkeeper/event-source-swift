import Foundation
import Testing
@testable import EventSource

struct EventParserTests {
  @Test func parseEvent() throws {
    var parser = EventParser()
    let string = """
    event: message
    id: 1734781882411940
    data: {"from":"fromValue","message":"messageValue"}\n\n
    """
    
    let data = Data(string.utf8)
    let events = parser.parse(data)
    
    #expect(events.count == 1)
    #expect(events[0].event == "message")
    #expect(events[0].id == "1734781882411940")
    #expect(events[0].data == "{\"from\":\"fromValue\",\"message\":\"messageValue\"}")
  }
  
  @Test func parseHeartbeat() throws {
    var parser = EventParser()
    let string = """
    event: heartbeat\n\n
    """
    
    let data = Data(string.utf8)
    let events = parser.parse(data)
    
    #expect(events.count == 1)
    #expect(events[0].isHeartbeat)
  }
  
  @Test func parseEvents() throws {
    var parser = EventParser()
    let string = """
    event: heartbeat
    
    event: message
    id: 1734781882411940
    data: {"from":"fromValue","message":"messageValue"}
    
    event: heartbeat
    
    event: heartbeat
    
    event: message
    id: eventId
    data: {"from":"fromValueEvent","message":"messageValueEvent"}
    
    
    """
    
    let data = Data(string.utf8)
    let events = parser.parse(data)
    
    #expect(events.count == 5)
    
    #expect(events[0].isHeartbeat)
    
    #expect(events[1].event == "message")
    #expect(events[1].id == "1734781882411940")
    #expect(events[1].data == "{\"from\":\"fromValue\",\"message\":\"messageValue\"}")
    
    #expect(events[2].isHeartbeat)
    
    #expect(events[3].isHeartbeat)
    
    #expect(events[4].event == "message")
    #expect(events[4].id == "eventId")
    #expect(events[4].data == "{\"from\":\"fromValueEvent\",\"message\":\"messageValueEvent\"}")
  }
}
