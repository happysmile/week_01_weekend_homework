def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_to_add)
  pet_shop[:admin][:total_cash] += cash_to_add
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, increase)
  pet_shop[:admin][:pets_sold] += increase
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  pets = pet_shop[:pets]
  pets_by_breed = []
  for pet in pets
    if(pet[:breed] == breed)
      pets_by_breed.push(pet)
    end
  end
  return pets_by_breed
end

def find_pet_by_name(pet_shop, name)
    pets = pet_shop[:pets]
    for pet in pets
      if(pet[:name] == name)
        pet_by_name = pet
      end
    end
    return pet_by_name
end

def remove_pet_by_name(pet_shop, name)
  pets = pet_shop[:pets]
  for pet in pets
    if (pet[:name] == name)
      pets.delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end


def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if (customer[:cash] >= new_pet[:price])
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if ( pet != nil )
     if (customer_can_afford_pet(customer, pet))
        add_pet_to_customer(customer, pet)
        remove_pet_by_name(pet_shop, pet[:name])
        remove_customer_cash(customer, pet[:price])
        add_or_remove_cash(pet_shop, pet[:price])
        increase_pets_sold(pet_shop, 1)
      end
  end
end
