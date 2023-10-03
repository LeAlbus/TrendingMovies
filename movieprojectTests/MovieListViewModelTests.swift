//
//  MovieListViewModelTests.swift
//  movieprojectTests
//
//  Created by Pedro Lopes on 03/10/23.
//

import XCTest
@testable import movieproject

class MovieListViewModelTests: XCTestCase {
    
    var sut: MovieListViewModel!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        sut = MovieListViewModel(networkService: mockNetworkService)
    }

    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testFetchMoviesSuccess() {
        mockNetworkService.fetchMoviesResult = .success([Movie(id: 1, title: "Test Movie", year: "2022", description: "Desc", posterURL: "/testPoster", backdropURL: "/testBackdrop")])
        
        let expectation = self.expectation(description: "Fetch movies completion is called")
        
        sut.fetchMovies(completion: {
            XCTAssertEqual(self.sut.numberOfMovies(), 1, "Number of movies should be 1")
            expectation.fulfill()
        }, errorHandler: {
            XCTFail("ErrorHandler should not be called on success")
        })
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
    
    func testFetchMoviesFailure() {
        mockNetworkService.fetchMoviesResult = .failure(NSError(domain: "", code: -1, userInfo: nil))
        
        let expectation = self.expectation(description: "Fetch movies errorHandler is called")
        
        sut.fetchMovies(completion: {
            XCTFail("Completion should not be called on failure")
        }, errorHandler: {
            XCTAssertEqual(self.sut.paging, 1, "Page should reset to 1 on error")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
    
    func testNumberOfMovies() {
        sut.fetchMovies(completion: {}, errorHandler: {})
        XCTAssertEqual(sut.numberOfMovies(), 1)
    }
    
    func testMovieAtIndex() {
        let expectation = self.expectation(description: "Fetch movies completion")

        sut.fetchMovies(completion: {expectation.fulfill()}, errorHandler: {})
        waitForExpectations(timeout: 1, handler: nil)

        let movie = sut.movieAtIndex(0)
        XCTAssertEqual(movie.title, "Test Movie")
    }
    
    func testViewModelForMovie() {
        sut.fetchMovies(completion: {}, errorHandler: {})
        let viewModel = sut.viewModelForMovie(at: 0)
        XCTAssertEqual(viewModel.title, "Test Movie")
    }
}

class MockNetworkService: NetworkServicesProtocol {
    var fetchMoviesResult: Result<[Movie], Error> = .success([
        Movie(id: 1, title: "Test Movie",
              year: "2020",
              description: "Test Description",
              posterURL: "/TestPoster",
              backdropURL: "/TestBackdrop")
    ])
    
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        completion(fetchMoviesResult)
    }
}
