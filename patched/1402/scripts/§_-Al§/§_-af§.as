package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import com.api.Player;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-af§ extends §_-K1K§
   {
      
      private var §_-Y1§:§_-y1B§ = null;
      
      private var §_-338§:String;
      
      private var §_-hI§:int = §_-Y2E§.§_-n2H§;
      
      public function §_-af§(param1:int, param2:String)
      {
         this.§_-338§ = param2;
         super(param1);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         var _loc5_:int = 0;
         clear();
         var _loc2_:int = int(param1.length);
         this.§_-T1t§(_loc2_ == 0 ? 1 : _loc2_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = int(param1[_loc3_]);
            this.§_-23Z§[_loc3_ * 2].text = String(_loc5_);
            _loc3_++;
         }
         var _loc4_:int = _loc2_ * 2;
         while(_loc4_ < this.§_-23Z§.length)
         {
            this.§_-23Z§[_loc4_].text = "";
            this.§_-23Z§[_loc4_ + 1].text = "";
            _loc4_ += 2;
         }
         this.§_-Q2O§();
         this.§_-R2E§();
      }
      
      override public function save() : §_-z1i§
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-u1M§)
         {
            _loc5_ = this.§_-23Z§[_loc3_ * 2].text;
            if(_loc5_ != "")
            {
               _loc6_ = int(_loc5_);
               if(!(_loc6_ <= 0 || _loc6_ in _loc2_))
               {
                  _loc2_[_loc6_] = true;
                  _loc1_.push(_loc6_);
               }
            }
            _loc3_++;
         }
         var _loc4_:§_-z1i§ = new §_-z1i§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-C1W§(_loc1_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc4_.§_-C1W§(_loc1_[_loc3_]);
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
      
      private function get §_-u1M§() : int
      {
         return this.§_-23Z§.length / 2;
      }
      
      private function §_-T1t§(param1:int) : void
      {
         while(this.§_-u1M§ < param1)
         {
            this.§_-t1o§ = 0;
            §_-HE§("ID",90);
            §_-HE§("Имя",280,false);
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
         this.§_-Y1§ = new §_-y1B§("<body><a href=\'event:#\'>" + this.§_-338§ + "</a></body>",0,0,§_-A3G§.style);
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
      
      override protected function §_-w1T§(param1:Event) : void
      {
         super.§_-w1T§(param1);
         this.§_-Q2O§();
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
            _loc3_ = this.§_-23Z§[_loc2_ * 2].text;
            if(_loc3_ == "")
            {
               this.§_-23Z§[_loc2_ * 2 + 1].text = "";
            }
            else
            {
               _loc4_ = int(_loc3_);
               if(_loc4_ <= 0)
               {
                  this.§_-23Z§[_loc2_ * 2 + 1].text = "";
               }
               else
               {
                  _loc5_ = this.§_-C14§(_loc4_);
                  this.§_-23Z§[_loc2_ * 2 + 1].text = _loc5_;
                  if(_loc5_ == "")
                  {
                     _loc1_.push(_loc4_);
                  }
               }
            }
            _loc2_++;
         }
         if(_loc1_.length > 0)
         {
            Game.request(_loc1_,this.§_-hI§,true);
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

