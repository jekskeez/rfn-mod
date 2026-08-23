package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-j1d§;
   import §_-E1v§.§_-y1B§;
   import §_-X1k§.§_-4v§;
   import §_-o10§.§_-pl§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-hU§ extends §_-K1K§
   {
      
      private static const §_-A39§:int = 1;
      
      private static const §_-1H§:int = 2;
      
      private static const §_-B3B§:int = 4;
      
      private static const §_-P14§:int = 5;
      
      private var level:uint = 0;
      
      private var experience:uint = 0;
      
      private var §_-12z§:uint = 0;
      
      private var §_-BM§:uint = 0;
      
      private var branch:uint = 0;
      
      private var skills:Object = {};
      
      private var §_-c1O§:Array = [];
      
      public function §_-hU§()
      {
         super(§_-K1K§.§_-Z2N§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         this.level = int(param1[0]);
         this.experience = int(param1[1]);
         this.§_-12z§ = int(param1[2]);
         this.§_-BM§ = int(param1[3]);
         this.branch = int(param1[4]);
         this.§_-23Z§[0].text = this.level.toString();
         this.§_-23Z§[1].text = this.experience.toString();
         this.§_-23Z§[2].text = this.§_-12z§.toString();
         this.§_-23Z§[3].text = this.branch.toString();
         this.§_-53W§[0].selected = (this.§_-BM§ & §_-A39§) != 0;
         this.§_-53W§[1].selected = (this.§_-BM§ & §_-1H§) != 0;
         this.§_-53W§[2].selected = (this.§_-BM§ & §_-B3B§) != 0;
         this.skills = {};
         var _loc2_:Array = param1[5];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc5_ = int(_loc2_[_loc3_]);
            this.skills[_loc5_] = {
               "free_level":_loc2_[_loc3_ + 1],
               "paid_level":_loc2_[_loc3_ + 2]
            };
            _loc3_ += 3;
         }
         var _loc4_:int = 4;
         _loc3_ = 0;
         while(_loc3_ < this.§_-c1O§.length)
         {
            _loc6_ = int(this.§_-c1O§[_loc3_]);
            if(_loc6_ in this.skills)
            {
               this.§_-23Z§[_loc4_].text = this.skills[_loc6_]["free_level"].toString();
               this.§_-23Z§[_loc4_ + 1].text = this.skills[_loc6_]["paid_level"].toString();
            }
            else
            {
               this.§_-23Z§[_loc4_].text = "0";
               this.§_-23Z§[_loc4_ + 1].text = "0";
            }
            _loc4_ += 2;
            _loc3_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.level = int(this.§_-23Z§[0].text);
         this.experience = int(this.§_-23Z§[1].text);
         this.§_-12z§ = int(this.§_-23Z§[2].text);
         this.branch = int(this.§_-23Z§[3].text);
         this.§_-BM§ = 0;
         if(this.§_-53W§[0].selected)
         {
            this.§_-BM§ |= §_-A39§;
         }
         if(this.§_-53W§[1].selected)
         {
            this.§_-BM§ |= §_-1H§;
         }
         if(this.§_-53W§[2].selected)
         {
            this.§_-BM§ |= §_-B3B§;
         }
         var _loc1_:Array = [];
         var _loc2_:int = 4;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-c1O§.length)
         {
            _loc6_ = int(this.§_-c1O§[_loc3_]);
            _loc7_ = int(this.§_-23Z§[_loc2_].text);
            _loc8_ = int(this.§_-23Z§[_loc2_ + 1].text);
            if(_loc7_ > 0 || _loc8_ > 0)
            {
               _loc1_.push(_loc6_);
               _loc1_.push(_loc7_);
               _loc1_.push(_loc8_);
            }
            _loc2_ += 2;
            _loc3_++;
         }
         var _loc4_:§_-z1i§ = new §_-z1i§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.writeByte(this.level);
         _loc4_.§_-C1W§(this.experience);
         _loc4_.writeByte(this.§_-12z§);
         _loc4_.writeByte(this.§_-BM§);
         _loc4_.writeByte(this.branch);
         var _loc5_:int = _loc1_.length / 3;
         _loc4_.§_-C1W§(_loc5_);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc4_.§_-C1W§(_loc1_[_loc3_]);
            _loc4_.writeByte(_loc1_[_loc3_ + 1]);
            _loc4_.writeByte(_loc1_[_loc3_ + 2]);
            _loc3_ += 3;
         }
         return _loc4_;
      }
      
      override protected function §_-c1v§() : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:§_-y1B§ = null;
         var _loc9_:§_-y1B§ = null;
         var _loc10_:int = 0;
         §_-HE§("Уровень",50);
         §_-HE§("Опыт",80);
         §_-HE§("Перья",50);
         §_-HE§("Активная ветка",50);
         this.§_-t1o§ = 0;
         this.§_-J1E§ += 25;
         this.§_-2H§.addChild(new §_-y1B§("Купленные ветки:",0,this.§_-J1E§,§_-A3G§.§_-EF§));
         this.§_-J1E§ += 25;
         §_-13x§(§_-4v§.§_-za§[§_-4v§.§_-bn§]);
         §_-13x§(§_-4v§.§_-za§[§_-4v§.§_-B3d§]);
         §_-13x§(§_-4v§.§_-za§[§_-4v§.§_-s1k§]);
         this.§_-t1o§ = 0;
         this.§_-J1E§ += 25;
         this.§_-c1O§ = [];
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < §_-4v§.§_-XV§.length)
         {
            _loc4_ = §_-4v§.§_-XV§[_loc2_];
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = int(_loc4_[_loc5_]);
               _loc7_ = this.§_-02A§(_loc6_);
               _loc8_ = new §_-y1B§(_loc7_,0,0,§_-A3G§.§_-v1I§);
               if(_loc8_.textWidth > _loc1_)
               {
                  _loc1_ = _loc8_.textWidth;
               }
               _loc5_++;
            }
            _loc2_++;
         }
         var _loc3_:int = _loc1_ + §_-P14§;
         _loc2_ = 0;
         while(_loc2_ < §_-4v§.§_-XV§.length)
         {
            _loc4_ = §_-4v§.§_-XV§[_loc2_];
            if(_loc4_.length > 0)
            {
               this.§_-2H§.addChild(new §_-y1B§(§_-4v§.§_-za§[_loc2_] + ":",0,this.§_-J1E§,§_-A3G§.§_-EF§));
               this.§_-J1E§ += 25;
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc6_ = int(_loc4_[_loc5_]);
                  this.§_-c1O§.push(_loc6_);
                  _loc7_ = this.§_-02A§(_loc6_);
                  _loc9_ = new §_-y1B§(_loc7_,0,this.§_-J1E§,§_-A3G§.§_-v1I§);
                  this.§_-2H§.addChild(_loc9_);
                  _loc10_ = _loc3_;
                  _loc10_ = this.§_-Pk§("Free",_loc10_,this.§_-J1E§);
                  _loc10_ = this.§_-Pk§("Paid",_loc10_,this.§_-J1E§);
                  this.§_-t1o§ = 0;
                  this.§_-J1E§ += 25;
                  _loc5_++;
               }
            }
            _loc2_++;
         }
      }
      
      override protected function get fieldTitleWidth() : int
      {
         return 150;
      }
      
      private function §_-02A§(param1:int) : String
      {
         if(param1 in §_-pl§.perkData && Boolean(§_-pl§.perkData[param1]["name"]))
         {
            return §_-pl§.perkData[param1]["name"];
         }
         return "Skill " + param1;
      }
      
      private function §_-Pk§(param1:String, param2:int, param3:int) : int
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(new §_-y1B§(param1,0,0,§_-A3G§.§_-v1I§));
         var _loc5_:TextField = new TextField();
         _loc5_.selectable = true;
         _loc5_.mouseEnabled = true;
         _loc5_.addEventListener(Event.CHANGE,§_-w1T§);
         §_-j1d§.§_-43I§(_loc5_,_loc4_,_loc4_.width + 2,0,30,18,100,true);
         _loc4_.addChild(_loc5_);
         _loc4_.x = param2;
         _loc4_.y = param3;
         this.§_-2H§.addChild(_loc4_);
         this.§_-23Z§.push(_loc5_);
         return param2 + _loc4_.width + §_-P14§;
      }
   }
}

