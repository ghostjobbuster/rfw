from concurrent.futures import ThreadPoolExecutor, as_completed
from robot.libraries.BuiltIn import BuiltIn

class ParallelLibrary:
    def __init__(self, max_workers=5):
        """Initialize the ParallelLibrary with a given number of threads."""
        self.max_workers = int(max_workers)

    def execute_in_parallel(self, keyword, *args_list):
        """
        Execute a keyword in parallel using threads.
        
        :param keyword: The name of the keyword to run.
        :param args_list: A list of tuples, each containing arguments for one invocation of the keyword.
        """
        keyword_func = BuiltIn().run_keyword
        futures = []
        results = []

        with ThreadPoolExecutor(max_workers=self.max_workers) as executor:
            for args in args_list:
                futures.append(executor.submit(keyword_func, keyword, *args))

            for future in as_completed(futures):
                results.append(future.result())

        return results

