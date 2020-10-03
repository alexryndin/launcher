use std::env;
use std::fs;
use std::path::Path;
use subprocess::Exec;

fn main() {
    let mut system_desktop_entries = vec![
        "/usr/share/applicns/".to_string(),
        "/usr/local/share/applications/sdf".to_string(),
    ];
    let home;
    match env::var("HOME") {
        Ok(h) => home = Some(h),
        Err(e) => home = None,
    };
    match home {
        Some(home) => system_desktop_entries.push(home),
        None => (),
    };
    for p in system_desktop_entries {
        if let Ok(entries) = fs::read_dir(p) {
            for entry in entries {
                if let Ok(entry) = entry {
                    if let Ok(file_type) = entry.file_type() {
                        println!("{:?}: {:?}", entry.path(), file_type);
                    } else {
                        println!("Couldn't get file type for {:?}", entry.path());
                    }
                }
            }
        }
    }
    let out = Exec::cmd("find");
    println!("Hello, world!");
    Exec::cmd("find");
}
