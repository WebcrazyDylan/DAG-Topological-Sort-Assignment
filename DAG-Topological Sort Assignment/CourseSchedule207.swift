//
//  CourseSchedule207.swift
//  DAG-Topological Sort Assignment
//
//  Created by Dylan Park on 2021-08-24.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
  var adj = [[Int]](repeating: [], count: numCourses)
  var indegrees = [Int](repeating: 0, count: numCourses)
  for edge in prerequisites {
    indegrees[edge[0]] += 1
    adj[edge[1]].append(edge[0])
  }
  
  var q = [Int]()
  for v in 0..<numCourses {
    if indegrees[v] == 0 {
      q.append(v)
    }
  }
  
  var dfs: ((Int) -> Void)!
  dfs = { (u) in
    for v in adj[u] {
      indegrees[v] -= 1
      if indegrees[v] == 0 {
        dfs(v)
      }
    }
  }
  
  for v in q {
    dfs(v)
  }
  
  for indegree in indegrees {
    if indegree != 0 {
      return false
    }
  }
  
  return true
}


