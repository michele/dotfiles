;; ----------------
;; JOURNAL SYSTEM !
;; ----------------

;; SETUP A ROBUST / GENERAL JOURNAL SYSTEM
;; I have modified this from:
;; http://www.howardism.org/Technical/Emacs/journaling-org.htm
;; Aqeel Akber, 2016 (@AdmiralAkber)
;; https://admiralakber.github.io/2016/12/21/emacs-org-mode-journal-and-log/

;; Author name to be auto inserted in entries
(setq journal-author "Michele Finotto")

;; This is the base folder where all your "books"
;; will be stored.
(setq journal-base-dir "~/Dropbox/notes/org/")


;; These are your "books" (folders), add as many as you like.
;; Note: "sub volumes" are acheivable with sub folders.
(setq journal-books '("near"
          "personal"
          "health"))

;; Functions for journal
(defun get-journal-file-today (book)
  "Return today's filename for a books journal file."
  (interactive (list (completing-read "Book: " journal-books) ))
  (expand-file-name
   (concat journal-base-dir book "/J"
     (format-time-string "%Y%m%d") ".org" )) )

(defun journal-today ()
  "Load todays journal entry for book"
  (interactive)
  (find-file (call-interactively 'get-journal-file-today)) )

(defun journal-entry-date ()
  "Inserts the journal heading based on the file's name."
  (when (string-match
   "\\(J\\)\\(20[0-9][0-9]\\)\\([0-9][0-9]\\)\\([0-9][0-9]\\)\\(.org\\)"
   (buffer-name))
    (let ((year  (string-to-number (match-string 2 (buffer-name))))
          (month (string-to-number (match-string 3 (buffer-name))))
          (day   (string-to-number (match-string 4 (buffer-name))))
          (datim nil))
      (setq datim (encode-time 0 0 0 day month year))
      (format-time-string "%Y-%m-%d (%A)" datim))))

;; Auto-insert journal header
(auto-insert-mode)
(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\(J\\)\\(20[0-9][0-9]\\)\\([0-9][0-9]\\)\\([0-9][0-9]\\)\\(.org\\)" . "Journal Header")
     '("Short description: "
       "#+TITLE: Journal Entry - "
       (car
  (last
   (split-string
    (file-name-directory buffer-file-name) "/ORG/"))) \n
       (concat "#+AUTHOR: " journal-author) \n
       "#+DATE: " (journal-entry-date) \n
       "#+FILETAGS: "
       (car
  (last
   (split-string
    (file-name-directory buffer-file-name) "/ORG/"))) \n \n
       > _ \n
       )))

;; Journal Key bindings
(global-set-key (kbd "C-c j") 'journal-today)
