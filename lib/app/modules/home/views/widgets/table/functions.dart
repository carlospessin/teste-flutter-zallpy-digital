statusDoPedido(status) {
  switch (status) {
    case 'paid':
      return 'Pago';
    case 'canceled':
      return 'Cancelado';
    case 'pending':
      return 'Pendente';
    default:
      return 'status não definido';
  }
}

statusDoPagamento(status) {
  switch (status) {
    case 'succeeded':
      return 'Aprovado';
    case 'pending':
      return 'Pendente';
    case 'Aprovada':
      return 'Aprovado';
    default:
      return 'status não definido';
  }
}

metodoDePagamento(status) {
  switch (status) {
    case 'pix':
      return 'Pix';
    case 'PIX':
      return 'Pix';
    case 'credit':
      return 'Crédito à vista';
    case 'credit_installments':
      return 'Crédito à prazo';
    case 'boleto':
      return 'Boleto';
    default:
      return 'status não definido';
  }
}