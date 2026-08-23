package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import §_-X1k§.§_-EJ§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-aH§ extends §_-K1K§
   {
      
      private var smiles:Vector.<int> = new Vector.<int>(0);
      
      public function §_-aH§()
      {
         super(§_-K1K§.§_-62E§);
      }
      
      override public function load(param1:*) : void
      {
         this.smiles = Vector.<int>(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-53W§.length)
         {
            this.§_-53W§[_loc2_].selected = this.smiles.indexOf(_loc2_) != -1;
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         this.smiles = new Vector.<int>(0);
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-53W§.length)
         {
            if(this.§_-53W§[_loc1_].selected)
            {
               this.smiles.push(_loc1_);
            }
            _loc1_++;
         }
         var _loc2_:§_-z1i§ = new §_-z1i§();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         _loc2_.§_-C1W§(this.smiles.length);
         _loc1_ = 0;
         while(_loc1_ < this.smiles.length)
         {
            _loc2_.writeByte(this.smiles[_loc1_]);
            _loc1_++;
         }
         return _loc2_;
      }
      
      override protected function §_-c1v§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.checkList.length)
         {
            switch(_loc1_)
            {
               case 10:
                  this.§_-t1o§ = 0;
                  this.§_-J1E§ += 25;
                  this.§_-2H§.addChild(new §_-y1B§("Пасха",150,this.§_-J1E§,§_-A3G§.§_-EF§));
                  this.§_-t1o§ = 0;
                  this.§_-J1E§ += 25;
                  break;
               case 15:
                  this.§_-t1o§ = 0;
                  this.§_-J1E§ += 25;
                  this.§_-2H§.addChild(new §_-y1B§("Новый год",150,this.§_-J1E§,§_-A3G§.§_-EF§));
                  this.§_-t1o§ = 0;
                  this.§_-J1E§ += 25;
                  break;
               case 25:
                  this.§_-t1o§ = 0;
                  this.§_-J1E§ += 25;
                  this.§_-2H§.addChild(new §_-y1B§("Новые",150,this.§_-J1E§,§_-A3G§.§_-EF§));
                  this.§_-t1o§ = 0;
                  this.§_-J1E§ += 25;
            }
            §_-13x§(this.checkList[_loc1_]);
            _loc1_++;
         }
      }
      
      override protected function get checkList() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-EJ§.§_-X2R§.length)
         {
            _loc1_.push(§_-EJ§.§_-X2R§[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

