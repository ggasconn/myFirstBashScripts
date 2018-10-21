#!/bin/bash
select option in 'Show date' 'Show users info' 'Show 10 process using most memory' 'Show 10 process using most CPU' 'Show network status' 'Exit'; do
  case $option in
    'Show date')
      printf 'Today is:\n'
      date
      ;;
    'Show users info')
      w
      ;;
    'Show 10 process using most memory')
      ps -aux --sort=-pmem | head -n 11
         ;;
    'Show 10 process using most CPU')
      ps -aux --sort=-pcpu | head -n 11
         ;;
    'Show network status')
      netstat
         ;;
    'Exit')
      exit 0
      ;;
    *)
      printf 'Invalid option\n'
      ;;
  esac
done
