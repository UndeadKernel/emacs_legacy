;;----------------------- H00ks --------------------------------



;;--------------------- File associations ----------------------
(setq auto-mode-alist
      (append '(("\\.C$"    . c++-mode)
		("\\.cc$"   . c++-mode)
		("\\.cpp$"  . c++-mode)
		("\\.cxx$"  . c++-mode)
		("\\.hxx$"  . c++-mode)
		("\\.hpp$"  . c++-mode)
		("\\.h$"    . c++-mode)
		("\\.hh$"   . c++-mode)
		("\\.idl$"  . c++-mode)
		("\\.ipp$"  . c++-mode)
		("\\.c$"    . c-mode)
		("\\.pl$"   . perl-mode)
		("\\.pm$"   . perl-mode)
		("\\.java$" . java-mode)
		("\\.inc$"  . php-mode)
		("\\.php$"  . php-mode)
		("\\.txt$"  . text-mode)
		("\\.py$"   . python-mode)
		("\\.jade$" . jade-mode)
		("\\.styl$" . sws-mode)
		)
	      
	      auto-mode-alist))