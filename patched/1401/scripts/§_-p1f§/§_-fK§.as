package §_-p1f§
{
   import §_-I10§.§_-01k§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-fK§ extends §_-6Y§
   {
      
      private var smiles:Vector.<int> = new Vector.<int>(0);
      
      public function §_-fK§()
      {
         super(§_-6Y§.§_-33V§);
      }
      
      override public function load(param1:*) : void
      {
         this.smiles = Vector.<int>(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-MO§.length)
         {
            this.§_-MO§[_loc2_].selected = this.smiles.indexOf(_loc2_) != -1;
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         this.smiles = new Vector.<int>(0);
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-MO§.length)
         {
            if(this.§_-MO§[_loc1_].selected)
            {
               this.smiles.push(_loc1_);
            }
            _loc1_++;
         }
         var _loc2_:§_-U1M§ = new §_-U1M§();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         _loc2_.§_-s15§(this.smiles.length);
         _loc1_ = 0;
         while(_loc1_ < this.smiles.length)
         {
            _loc2_.writeByte(this.smiles[_loc1_]);
            _loc1_++;
         }
         return _loc2_;
      }
      
      override protected function §_-X26§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.checkList.length)
         {
            switch(_loc1_)
            {
               case 10:
                  this.§_-22N§ = 0;
                  this.§_-uH§ += 25;
                  this.§_-HL§.addChild(new §_-i1J§("Пасха",150,this.§_-uH§,§_-32A§.§_-hP§));
                  this.§_-22N§ = 0;
                  this.§_-uH§ += 25;
                  break;
               case 15:
                  this.§_-22N§ = 0;
                  this.§_-uH§ += 25;
                  this.§_-HL§.addChild(new §_-i1J§("Новый год",150,this.§_-uH§,§_-32A§.§_-hP§));
                  this.§_-22N§ = 0;
                  this.§_-uH§ += 25;
                  break;
               case 25:
                  this.§_-22N§ = 0;
                  this.§_-uH§ += 25;
                  this.§_-HL§.addChild(new §_-i1J§("Новые",150,this.§_-uH§,§_-32A§.§_-hP§));
                  this.§_-22N§ = 0;
                  this.§_-uH§ += 25;
            }
            §_-c1H§(this.checkList[_loc1_]);
            _loc1_++;
         }
      }
      
      override protected function get checkList() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-01k§.§_-ZC§.length)
         {
            _loc1_.push(§_-01k§.§_-ZC§[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

