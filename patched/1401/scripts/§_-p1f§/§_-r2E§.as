package §_-p1f§
{
   import §_-92M§.§_-U1r§;
   import §_-I10§.§_-82N§;
   import §_-I10§.§_-W1e§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-43M§;
   import §_-l26§.§_-i1J§;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import protocol.§_-U1M§;
   
   public class §_-r2E§
   {
      
      public var sprite:Sprite = new Sprite();
      
      private var §_-K1P§:TextField = null;
      
      private var §_-86§:Sprite = new Sprite();
      
      private var §_-P2B§:Vector.<TextField> = new Vector.<TextField>(0);
      
      private var §_-M11§:Vector.<CheckBox> = new Vector.<CheckBox>(0);
      
      private var §_-e2V§:Object = {};
      
      private var §_-s1r§:Boolean = false;
      
      private var §_-43b§:Function = null;
      
      private var §_-R1k§:Function = null;
      
      public function §_-r2E§(param1:Function, param2:Function)
      {
         super();
         this.§_-43b§ = param1;
         this.§_-R1k§ = param2;
         var _loc3_:§_-i1J§ = new §_-i1J§("<body><b>Категория настроек</b></body>",0,0,§_-32A§.style);
         this.sprite.addChild(_loc3_);
         this.§_-K1P§ = this.§_-01s§("ID",40,0,22);
         this.§_-K1P§.addEventListener(Event.CHANGE,this.§_-42t§);
         this.§_-86§.y = 48;
         this.sprite.addChild(this.§_-86§);
      }
      
      public function load(param1:int, param2:§_-U1M§) : void
      {
         this.§_-K1P§.text = param1.toString();
         this.§_-e2V§ = §_-L9§.§_-G2m§(param1,param2);
         this.§_-s1r§ = this.§_-e2V§ != null && "raw" in this.§_-e2V§;
         this.§_-H1v§();
      }
      
      public function §_-Q1d§() : Array
      {
         if(this.§_-K1P§.text == "")
         {
            return null;
         }
         var _loc1_:int = int(this.§_-K1P§.text);
         this.§_-o1u§();
         var _loc2_:§_-U1M§ = §_-L9§.encode(_loc1_,this.§_-e2V§);
         return [_loc1_,_loc2_];
      }
      
      public function §_-u22§() : int
      {
         return int(this.§_-86§.y + this.§_-86§.height + 8);
      }
      
      public function dispose() : void
      {
         if(this.sprite.parent)
         {
            this.sprite.parent.removeChild(this.sprite);
         }
         this.clearContent();
         this.§_-K1P§.removeEventListener(Event.CHANGE,this.§_-42t§);
      }
      
      private function §_-42t§(param1:Event) : void
      {
         this.§_-o1u§();
         this.§_-e2V§ = {};
         this.§_-s1r§ = false;
         this.§_-H1v§();
         this.§_-j1f§();
      }
      
      private function §_-H1v§() : void
      {
         this.clearContent();
         var _loc1_:int = int(this.§_-K1P§.text);
         var _loc2_:§_-i1J§ = new §_-i1J§(§_-L9§.§_-Z28§(_loc1_),0,0,§_-32A§.§_-hP§);
         this.§_-86§.addChild(_loc2_);
         var _loc3_:int = 22;
         if(this.§_-s1r§)
         {
            _loc3_ = this.§_-Un§(_loc3_);
         }
         else
         {
            switch(_loc1_)
            {
               case §_-82N§.§_-NF§:
                  _loc3_ = this.§_-83d§(_loc3_);
                  break;
               case §_-82N§.§_-43h§:
                  _loc3_ = this.§_-S2p§(_loc3_);
                  break;
               case §_-82N§.§_-K7§:
                  _loc3_ = this.§_-920§(_loc3_);
                  break;
               case §_-82N§.§_-J1S§:
                  _loc3_ = this.§_-72U§(_loc3_);
                  break;
               case §_-82N§.§_-c7§:
                  _loc3_ = this.§_-01E§(_loc3_);
                  break;
               case §_-82N§.§_-a1K§:
                  _loc3_ = this.§_-ge§(_loc3_);
                  break;
               default:
                  this.§_-s1r§ = true;
                  if(!("raw" in this.§_-e2V§))
                  {
                     this.§_-e2V§ = {"raw":[]};
                  }
                  _loc3_ = this.§_-Un§(_loc3_);
            }
         }
         this.§_-86§.height = _loc3_;
         if(this.§_-R1k§ != null)
         {
            this.§_-R1k§();
         }
      }
      
      private function §_-83d§(param1:int) : int
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < §_-U1r§.§_-N1p§)
         {
            _loc3_ = _loc2_ in this.§_-e2V§ ? this.§_-e2V§[_loc2_] : {
               "class":0,
               "perk":0
            };
            this.§_-a1A§("Слот " + (_loc2_ + 1) + " class",String(_loc3_["class"]),45,0,param1);
            this.§_-a1A§("perk",String(_loc3_["perk"]),70,180,param1);
            param1 += 24;
            _loc2_++;
         }
         return param1;
      }
      
      private function §_-S2p§(param1:int) : int
      {
         this.§_-12H§("Качество",int(this.§_-e2V§["quality"]) != 0,0,param1);
         this.§_-12H§("Подсветка",int(this.§_-e2V§["highlight"]) != 0,120,param1);
         this.§_-12H§("Затемнение",int(this.§_-e2V§["blackout"]) != 0,260,param1);
         return param1 + 24;
      }
      
      private function §_-920§(param1:int) : int
      {
         this.§_-a1A§("closeout_period",String(this.§_-e2V§["closeout_period"] || 0),120,0,param1);
         this.§_-a1A§("stock_package",String(this.§_-e2V§["stock_package"] || 0),120,220,param1);
         param1 += 24;
         this.§_-a1A§("news_id",String(this.§_-e2V§["news_id"] || 0),120,0,param1);
         return param1 + 24;
      }
      
      private function §_-72U§(param1:int) : int
      {
         this.§_-a1A§("chatState",String(this.§_-e2V§["chatState"] || 0),60,0,param1);
         return param1 + 24;
      }
      
      private function §_-01E§(param1:int) : int
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         while(_loc2_ < §_-W1e§.§_-ZC§.length)
         {
            _loc3_ = §_-W1e§.§_-ZC§[_loc2_];
            this.§_-a1A§(_loc3_,String(this.§_-e2V§[_loc3_] || 0),120,0,param1);
            param1 += 24;
            _loc2_++;
         }
         return param1;
      }
      
      private function §_-ge§(param1:int) : int
      {
         var _loc5_:Object = null;
         var _loc2_:Array = this.§_-e2V§["seen"] != null ? this.§_-e2V§["seen"] as Array : [];
         var _loc3_:int = Math.max(_loc2_.length,3);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc4_ < _loc2_.length ? _loc2_[_loc4_] : {
               "type":"",
               "startSec":0
            };
            this.§_-a1A§("type",String(_loc5_["type"]),120,0,param1);
            this.§_-a1A§("startSec",String(_loc5_["startSec"]),90,200,param1);
            param1 += 24;
            _loc4_++;
         }
         return param1;
      }
      
      private function §_-Un§(param1:int) : int
      {
         var _loc2_:Array = this.§_-e2V§["raw"] as Array;
         var _loc3_:String = _loc2_ != null ? _loc2_.join(",") : "";
         this.§_-a1A§("Байты (через запятую)",_loc3_,400,0,param1);
         return param1 + 24;
      }
      
      private function §_-o1u§() : void
      {
         var _loc2_:String = null;
         var _loc1_:int = int(this.§_-K1P§.text);
         if(this.§_-s1r§ || _loc1_ > §_-82N§.§_-a1K§)
         {
            _loc2_ = this.§_-P2B§.length > 0 ? this.§_-P2B§[0].text : "";
            this.§_-e2V§ = {"raw":this.§_-I1o§(_loc2_)};
            return;
         }
         switch(_loc1_)
         {
            case §_-82N§.§_-NF§:
               this.§_-TB§();
               break;
            case §_-82N§.§_-43h§:
               this.§_-P19§();
               break;
            case §_-82N§.§_-K7§:
               this.§_-71F§();
               break;
            case §_-82N§.§_-J1S§:
               this.§_-e2V§ = {"chatState":int(this.§_-P2B§[0].text)};
               break;
            case §_-82N§.§_-c7§:
               this.§_-HD§();
               break;
            case §_-82N§.§_-a1K§:
               this.§_-C9§();
         }
      }
      
      private function §_-TB§() : void
      {
         this.§_-e2V§ = {};
         var _loc1_:int = 0;
         while(_loc1_ < §_-U1r§.§_-N1p§)
         {
            this.§_-e2V§[_loc1_] = {
               "class":int(this.§_-P2B§[_loc1_ * 2].text),
               "perk":int(this.§_-P2B§[_loc1_ * 2 + 1].text)
            };
            _loc1_++;
         }
      }
      
      private function §_-P19§() : void
      {
         this.§_-e2V§ = {
            "quality":(this.§_-M11§[0].selected ? 1 : 0),
            "highlight":(this.§_-M11§[1].selected ? 1 : 0),
            "blackout":(this.§_-M11§[2].selected ? 1 : 0)
         };
      }
      
      private function §_-71F§() : void
      {
         this.§_-e2V§ = {
            "closeout_period":int(this.§_-P2B§[0].text),
            "stock_package":int(this.§_-P2B§[1].text),
            "news_id":int(this.§_-P2B§[2].text)
         };
      }
      
      private function §_-HD§() : void
      {
         this.§_-e2V§ = {};
         var _loc1_:int = 0;
         while(_loc1_ < §_-W1e§.§_-ZC§.length)
         {
            this.§_-e2V§[§_-W1e§.§_-ZC§[_loc1_]] = int(this.§_-P2B§[_loc1_].text);
            _loc1_++;
         }
      }
      
      private function §_-C9§() : void
      {
         var _loc3_:String = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-P2B§.length)
         {
            _loc3_ = this.§_-P2B§[_loc2_].text;
            if(_loc3_ != "")
            {
               _loc1_.push({
                  "type":_loc3_,
                  "startSec":int(this.§_-P2B§[_loc2_ + 1].text)
               });
            }
            _loc2_ += 2;
         }
         this.§_-e2V§ = {"seen":_loc1_};
      }
      
      private function §_-I1o§(param1:String) : Array
      {
         var _loc5_:String = null;
         var _loc2_:Array = [];
         if(param1 == "")
         {
            return _loc2_;
         }
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = String(_loc3_[_loc4_]);
            if(_loc5_ != "")
            {
               _loc2_.push(int(_loc5_));
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function §_-01s§(param1:String, param2:int, param3:int, param4:int) : TextField
      {
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(new §_-i1J§(param1,0,0,§_-32A§.§_-53t§));
         var _loc6_:TextField = new TextField();
         _loc6_.selectable = true;
         _loc6_.mouseEnabled = true;
         §_-43M§.§_-22h§(_loc6_,_loc5_,_loc5_.width + 2,0,param2,18,100,true);
         _loc5_.x = param3;
         _loc5_.y = param4;
         this.sprite.addChild(_loc5_);
         return _loc6_;
      }
      
      private function §_-a1A§(param1:String, param2:String, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Sprite = new Sprite();
         _loc6_.addChild(new §_-i1J§(param1,0,0,§_-32A§.§_-53t§));
         var _loc7_:TextField = new TextField();
         _loc7_.text = param2;
         _loc7_.selectable = true;
         _loc7_.mouseEnabled = true;
         _loc7_.addEventListener(Event.CHANGE,this.§_-8s§);
         §_-43M§.§_-22h§(_loc7_,_loc6_,_loc6_.width + 2,0,param3,18,100,true);
         _loc6_.x = param4;
         _loc6_.y = param5;
         this.§_-86§.addChild(_loc6_);
         this.§_-P2B§.push(_loc7_);
      }
      
      private function §_-12H§(param1:String, param2:Boolean, param3:int, param4:int) : void
      {
         var _loc5_:CheckBox = new CheckBox();
         _loc5_.label = param1;
         _loc5_.selected = param2;
         _loc5_.x = param3;
         _loc5_.y = param4;
         _loc5_.addEventListener(Event.CHANGE,this.§_-8s§);
         this.§_-86§.addChild(_loc5_);
         this.§_-M11§.push(_loc5_);
      }
      
      private function clearContent() : void
      {
         while(this.§_-86§.numChildren > 0)
         {
            this.§_-86§.removeChildAt(0);
         }
         this.§_-P2B§ = new Vector.<TextField>(0);
         this.§_-M11§ = new Vector.<CheckBox>(0);
      }
      
      private function §_-8s§(param1:Event) : void
      {
         this.§_-j1f§();
      }
      
      private function §_-j1f§() : void
      {
         if(this.§_-43b§ != null)
         {
            this.§_-43b§();
         }
      }
   }
}

