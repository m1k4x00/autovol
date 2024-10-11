#!/bin/bash

modes=(windows.cmdline.CmdLine windows.dlllist.DllList windows.hashdump.Hashdump windows.filescan.FileScan windows.getsids.GetSIDs windows.malfind.Malfind windows.netscan.NetScan windows.netstat.NetStat  windows.lsadump.Lsadump windows.pslist.PsList windows.psscan.PsScan windows.pstree.PsTree windows.registry.hivelist.HiveList windows.registry.hivescan.HiveScan windows.driverirp.DriverIrp windows.ssdt.SSDT windows.ldrmodules.LdrModules windows.modscan.ModScan)

if [ -z "$1" ]; then
	echo "Volatility3 automation tool"
	echo
	echo "*                           *"
	echo " *                         * "
	echo "  *                       *  "
	echo "   *                     *   "
	echo "    *                   *    "
	echo "     *                 *     "
	echo "      *               *      "
	echo "       *             *       "
	echo "        *           *        "
	echo "         *         *         "
	echo "          *       *          "
	echo "           *     *           "
	echo "            *   *            "
	echo "             * *             "
	echo "              *              "
	echo "*****************************"
	echo "*****************************"
	echo
	echo "Usage: bash autovol.sh memdump"
	exit 1
fi

if [ -d "memory" ]; then
	rm -r memory
fi

mkdir memory

for m in "${modes[@]}"
do
	echo "generating: ${m}" 
	vol -f $1 $m  > memory/$(echo $m)
done
