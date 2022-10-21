<?php
    use Illuminate\Support\Facades\DB;
?>
@extends('layouts.app')

@section('content')
    <style>
        table tr{
            padding: 10px;
        }
    </style>
    <table style="padding: 10px;">
        <tr>
            <!--<th>No</th>-->
            <th>No</th>
            <th>Kode Matakuliah</th>
            <th>Nama Matakuliah</th>
            <th>SKS</th>

            <!--<th>Student ID</th>
            <th>Nama</th>
            <th>Jumlah KRS</th>-->
        </tr>
        <?php
        $rows = \DB::select("select * FROM alicia_matakuliah WHERE StudentID = '81200039'");
        $no = 1;
        foreach ($rows as $row) {
            echo "<tr>";
            echo "<td>".$no."</td>";
            echo "<td>".$row->kode."</td>";
            echo "<td>".$row->nama."</td>";
            echo "<td>".$row->sks."</td>";
            echo "</tr>";
            $no ++;
        }
        ?>
    </table>
@endsection