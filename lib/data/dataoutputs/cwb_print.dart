import 'dart:typed_data';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:CashierPOS/core/extensions/int_ext.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image/image.dart' as img;

import '../../presentation/home/models/order_item.dart';

class CwbPrint {
  CwbPrint._init();

  static final CwbPrint instance = CwbPrint._init();

  Future<List<int>> printOrder(
      int tableNumber,
      List<OrderItem> products,
      int totalQuantity,
      int totalPrice,
      String paymentMethod,
      int nominalBayar,
      String namaKasir,
      String transactionTime) async {
    List<int> bytes = [];

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    bytes += generator.reset();
    bytes += generator.text('Aneka Ria',
        styles: const PosStyles(
          bold: true,
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));
    bytes += generator.text('Traditional Coffee Shop',
        styles: const PosStyles(
          bold: true,
          align: PosAlign.center,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ));

    bytes += generator.text('Jl. Bintan No.77',
        styles: const PosStyles(bold: true, align: PosAlign.center));

    bytes += generator.feed(1);
    bytes += generator.text(
        'Date : ${DateFormat('dd-MM-yyyy HH:mm').format(DateTime.parse(transactionTime))}',
        styles: const PosStyles(bold: false, align: PosAlign.center));
    // bytes += generator.text('Start 12 Desember 2023',
    //     styles: const PosStyles(bold: false, align: PosAlign.center));
    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Meja Nomor:',
        width: 8,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: '$tableNumber',
        width: 4,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    bytes += generator.feed(1);
    bytes += generator.text('Pesanan:',
        styles: const PosStyles(bold: true, align: PosAlign.left));
    bytes += generator.feed(1);
    //for from data
    for (final product in products) {
      bytes += generator.text(product.product.name,
          styles: const PosStyles(align: PosAlign.left));

      bytes += generator.row([
        PosColumn(
          text:
              '${product.product.price.currencyFormatRp} x ${product.quantity}',
          width: 8,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text:
              '${(product.product.price * product.quantity).currencyFormatRp}',
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }

    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Total',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: totalPrice.currencyFormatRp,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: 'Bayar',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: nominalBayar.currencyFormatRp,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    if (nominalBayar > totalPrice) {
      bytes += generator.row([
        PosColumn(
          text: 'Kembalian',
          width: 6,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: (nominalBayar - totalPrice).currencyFormatRp,
          width: 6,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }

    bytes += generator.row([
      PosColumn(
        text: 'Cara Pembayaran',
        width: 8,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: paymentMethod == 'cash' ? 'Tunai' : 'QRIS',
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(1);
    bytes += generator.text('Terima kasih',
        styles: const PosStyles(bold: false, align: PosAlign.center));
    bytes += generator.feed(1);

    bytes += generator.text('POS Apps by : ',
        styles: const PosStyles(bold: false, align: PosAlign.left));
    bytes += generator.text('IG : @martinusgoh ',
        styles: const PosStyles(bold: false, align: PosAlign.left));

    bytes += generator.feed(3);

    return bytes;
  }
}
