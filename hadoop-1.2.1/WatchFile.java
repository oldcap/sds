import java.nio.file.Files;
import java.nio.file.FileSystems;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;
import java.nio.file.WatchEvent;
import static java.nio.file.StandardWatchEventKinds.*;
import java.io.IOException;	

public class WatchFile{
	public static void main(String[] args) {
		WatchService watcher;
		try {
			watcher = FileSystems.getDefault().newWatchService();
			Path localFilePath = Paths.get("/root/test.log").getParent();
			System.out.println("Adding watch on " + localFilePath.toString());
			WatchKey key = localFilePath.register(watcher,
				ENTRY_MODIFY);
		} catch (IOException x) {
			System.err.println(x);
			return;
		}

		for (;;) {

    // wait for key to be signaled
			WatchKey key;
			try {
				key = watcher.take();
			} catch (InterruptedException x) {
				return;
			}

			for (WatchEvent<?> event: key.pollEvents()) {
				System.out.println("Caught change!");
			}
		}
	}
} 