resource "azurerm_linux_virtual_machine" "main" {
  name                = "vm-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = var.vm_size

  admin_username = "azureuser"

  disable_password_authentication = true

  network_interface_ids = [azurerm_network_interface.main.id]

  os_disk {
    name                 = "osdisk-${var.environment}"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  # Cloud-init script to install and start Nginx
  custom_data = base64encode(file("${path.module}/cloud-init.sh"))

  tags = {
    Name        = "${var.environment}-vm"
    Environment = var.environment
  }

  depends_on = [
    azurerm_subnet_network_security_group_association.main
  ]
}
