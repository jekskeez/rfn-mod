package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import com.api.Player;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-o2E§ extends §_-K1K§
   {
      
      private var §_-Y1§:§_-y1B§ = null;
      
      public function §_-o2E§()
      {
         super(§_-K1K§.§_-F§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         clear();
         var _loc2_:int = int(param1.length / 4);
         this.§_-T1t§(_loc2_ == 0 ? 1 : _loc2_);
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = int(param1[_loc4_ * 4]);
            _loc7_ = int(param1[_loc4_ * 4 + 2]);
            _loc8_ = int(param1[_loc4_ * 4 + 3]);
            this.§_-23Z§[_loc4_ * 4].text = String(_loc6_);
            this.§_-23Z§[_loc4_ * 4 + 1].text = String(_loc7_);
            this.§_-23Z§[_loc4_ * 4 + 2].text = this.§_-C14§(_loc7_);
            this.§_-23Z§[_loc4_ * 4 + 3].text = String(_loc8_);
            if(this.§_-23Z§[_loc4_ * 4 + 2].text == "")
            {
               _loc3_.push(_loc7_);
            }
            _loc4_++;
         }
         var _loc5_:int = _loc2_ * 4;
         while(_loc5_ < this.§_-23Z§.length)
         {
            this.§_-23Z§[_loc5_].text = "";
            this.§_-23Z§[_loc5_ + 1].text = "";
            this.§_-23Z§[_loc5_ + 2].text = "";
            this.§_-23Z§[_loc5_ + 3].text = "";
            _loc5_ += 4;
         }
         if(_loc3_.length > 0)
         {
            Game.request(_loc3_,§_-Y2E§.§_-n2H§,true);
         }
         this.§_-R2E§();
      }
      
      override public function save() : §_-z1i§
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc1_:Array = [];
         var _loc2_:int = this.§_-u1M§;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = this.§_-23Z§[_loc3_ * 4].text;
            _loc6_ = this.§_-23Z§[_loc3_ * 4 + 1].text;
            _loc7_ = this.§_-23Z§[_loc3_ * 4 + 3].text;
            if(_loc5_ != "")
            {
               _loc1_.push([int(_loc5_),int(_loc6_),int(_loc7_)]);
            }
            _loc3_++;
         }
         var _loc4_:§_-z1i§ = new §_-z1i§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-C1W§(_loc1_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc4_.§_-C1W§(_loc1_[_loc3_][0]);
            _loc4_.§_-C1W§(_loc1_[_loc3_][1]);
            _loc4_.§_-C1W§(_loc1_[_loc3_][2]);
            _loc3_++;
         }
         return _loc4_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-V6§();
      }
      
      override protected function §_-c1v§() : void
      {
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
      
      override protected function §_-w1T§(param1:Event) : void
      {
         super.§_-w1T§(param1);
         this.§_-Q2O§();
      }
      
      private function get §_-u1M§() : int
      {
         return this.§_-23Z§.length / 4;
      }
      
      private function §_-T1t§(param1:int) : void
      {
         while(this.§_-u1M§ < param1)
         {
            this.§_-t1o§ = 0;
            §_-HE§("GiftID",80);
            §_-HE§("SenderID",80);
            §_-HE§("Имя",170,false);
            §_-HE§("Time",100);
            this.§_-J1E§ += 25;
         }
         this.§_-R2E§();
         dispatchEvent(new Event("change"));
      }
      
      private function §_-V6§() : void
      {
         if(this.§_-Y1§ != null)
         {
            return;
         }
         this.§_-Y1§ = new §_-y1B§("<body><a href=\'event:#\'>Добавить подарок</a></body>",0,0,§_-A3G§.style);
         this.§_-Y1§.addEventListener(MouseEvent.CLICK,this.§_-z1A§);
         this.§_-R2E§();
      }
      
      private function §_-R2E§() : void
      {
         if(!this.§_-Y1§)
         {
            return;
         }
         this.§_-Y1§.x = 0;
         this.§_-Y1§.y = this.§_-u1M§ == 0 ? 0 : this.§_-2H§.height;
         addChild(this.§_-Y1§);
      }
      
      private function §_-z1A§(param1:MouseEvent) : void
      {
         this.§_-T1t§(this.§_-u1M§ + 1);
      }
      
      private function §_-Q2O§() : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-u1M§)
         {
            _loc3_ = this.§_-23Z§[_loc2_ * 4 + 1].text;
            if(_loc3_ == "")
            {
               this.§_-23Z§[_loc2_ * 4 + 2].text = "";
            }
            else
            {
               _loc4_ = int(_loc3_);
               _loc5_ = this.§_-C14§(_loc4_);
               this.§_-23Z§[_loc2_ * 4 + 2].text = _loc5_;
               if(_loc5_ == "")
               {
                  _loc1_.push(_loc4_);
               }
            }
            _loc2_++;
         }
         if(_loc1_.length > 0)
         {
            Game.request(_loc1_,§_-Y2E§.§_-n2H§,true);
         }
      }
      
      private function §_-C14§(param1:int) : String
      {
         var _loc2_:Player = Game.getPlayer(param1);
         if(_loc2_ == null || !_loc2_.isLoaded(§_-Y2E§.§_-n2H§))
         {
            return "";
         }
         return _loc2_.name;
      }
   }
}

