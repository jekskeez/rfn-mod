package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-j1d§;
   import §_-E1v§.§_-y1B§;
   import §_-HG§.§_-of§;
   import §_-X1k§.§_-N10§;
   import §_-X1k§.§_-u2n§;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import protocol.§_-z1i§;
   
   public class §_-53n§
   {
      
      public var sprite:Sprite = new Sprite();
      
      private var §_-Q1a§:TextField = null;
      
      private var §_-F1S§:Sprite = new Sprite();
      
      private var §_-Ae§:Vector.<TextField> = new Vector.<TextField>(0);
      
      private var §_-p1X§:Vector.<CheckBox> = new Vector.<CheckBox>(0);
      
      private var §_-71W§:Object = {};
      
      private var §_-Z2y§:Boolean = false;
      
      private var §_-z2X§:Function = null;
      
      private var §_-Z1l§:Function = null;
      
      public function §_-53n§(param1:Function, param2:Function)
      {
         super();
         this.§_-z2X§ = param1;
         this.§_-Z1l§ = param2;
         var _loc3_:§_-y1B§ = new §_-y1B§("<body><b>Категория настроек</b></body>",0,0,§_-A3G§.style);
         this.sprite.addChild(_loc3_);
         this.§_-Q1a§ = this.§_-HE§("ID",40,0,22);
         this.§_-Q1a§.addEventListener(Event.CHANGE,this.§_-W6§);
         this.§_-F1S§.y = 48;
         this.sprite.addChild(this.§_-F1S§);
      }
      
      public function load(param1:int, param2:§_-z1i§) : void
      {
         this.§_-Q1a§.text = param1.toString();
         this.§_-71W§ = §_-G1E§.§_-Y2a§(param1,param2);
         this.§_-Z2y§ = this.§_-71W§ != null && "raw" in this.§_-71W§;
         this.§_-P21§();
      }
      
      public function §_-C3e§() : Array
      {
         if(this.§_-Q1a§.text == "")
         {
            return null;
         }
         var _loc1_:int = int(this.§_-Q1a§.text);
         this.§_-v1D§();
         var _loc2_:§_-z1i§ = §_-G1E§.encode(_loc1_,this.§_-71W§);
         return [_loc1_,_loc2_];
      }
      
      public function §_-fc§() : int
      {
         return int(this.§_-F1S§.y + this.§_-F1S§.height + 8);
      }
      
      public function dispose() : void
      {
         if(this.sprite.parent)
         {
            this.sprite.parent.removeChild(this.sprite);
         }
         this.clearContent();
         this.§_-Q1a§.removeEventListener(Event.CHANGE,this.§_-W6§);
      }
      
      private function §_-W6§(param1:Event) : void
      {
         this.§_-v1D§();
         this.§_-71W§ = {};
         this.§_-Z2y§ = false;
         this.§_-P21§();
         this.§_-1R§();
      }
      
      private function §_-P21§() : void
      {
         this.clearContent();
         var _loc1_:int = int(this.§_-Q1a§.text);
         var _loc2_:§_-y1B§ = new §_-y1B§(§_-G1E§.§_-N2z§(_loc1_),0,0,§_-A3G§.§_-EF§);
         this.§_-F1S§.addChild(_loc2_);
         var _loc3_:int = 22;
         if(this.§_-Z2y§)
         {
            _loc3_ = this.§_-C2X§(_loc3_);
         }
         else
         {
            switch(_loc1_)
            {
               case §_-u2n§.§_-r2t§:
                  _loc3_ = this.§_-n1L§(_loc3_);
                  break;
               case §_-u2n§.§_-eS§:
                  _loc3_ = this.§_-i7§(_loc3_);
                  break;
               case §_-u2n§.§_-P1g§:
                  _loc3_ = this.§_-s2T§(_loc3_);
                  break;
               case §_-u2n§.§_-M1L§:
                  _loc3_ = this.§_-r2k§(_loc3_);
                  break;
               case §_-u2n§.§_-O2m§:
                  _loc3_ = this.§_-D2O§(_loc3_);
                  break;
               case §_-u2n§.§_-gu§:
                  _loc3_ = this.§_-41B§(_loc3_);
                  break;
               default:
                  this.§_-Z2y§ = true;
                  if(!("raw" in this.§_-71W§))
                  {
                     this.§_-71W§ = {"raw":[]};
                  }
                  _loc3_ = this.§_-C2X§(_loc3_);
            }
         }
         this.§_-F1S§.height = _loc3_;
         if(this.§_-Z1l§ != null)
         {
            this.§_-Z1l§();
         }
      }
      
      private function §_-n1L§(param1:int) : int
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < §_-of§.§_-3g§)
         {
            _loc3_ = _loc2_ in this.§_-71W§ ? this.§_-71W§[_loc2_] : {
               "class":0,
               "perk":0
            };
            this.§_-j1D§("Слот " + (_loc2_ + 1) + " class",String(_loc3_["class"]),45,0,param1);
            this.§_-j1D§("perk",String(_loc3_["perk"]),70,180,param1);
            param1 += 24;
            _loc2_++;
         }
         return param1;
      }
      
      private function §_-i7§(param1:int) : int
      {
         this.§_-w2D§("Качество",int(this.§_-71W§["quality"]) != 0,0,param1);
         this.§_-w2D§("Подсветка",int(this.§_-71W§["highlight"]) != 0,120,param1);
         this.§_-w2D§("Затемнение",int(this.§_-71W§["blackout"]) != 0,260,param1);
         return param1 + 24;
      }
      
      private function §_-s2T§(param1:int) : int
      {
         this.§_-j1D§("closeout_period",String(this.§_-71W§["closeout_period"] || 0),120,0,param1);
         this.§_-j1D§("stock_package",String(this.§_-71W§["stock_package"] || 0),120,220,param1);
         param1 += 24;
         this.§_-j1D§("news_id",String(this.§_-71W§["news_id"] || 0),120,0,param1);
         return param1 + 24;
      }
      
      private function §_-r2k§(param1:int) : int
      {
         this.§_-j1D§("chatState",String(this.§_-71W§["chatState"] || 0),60,0,param1);
         return param1 + 24;
      }
      
      private function §_-D2O§(param1:int) : int
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         while(_loc2_ < §_-N10§.§_-X2R§.length)
         {
            _loc3_ = §_-N10§.§_-X2R§[_loc2_];
            this.§_-j1D§(_loc3_,String(this.§_-71W§[_loc3_] || 0),120,0,param1);
            param1 += 24;
            _loc2_++;
         }
         return param1;
      }
      
      private function §_-41B§(param1:int) : int
      {
         var _loc5_:Object = null;
         var _loc2_:Array = this.§_-71W§["seen"] != null ? this.§_-71W§["seen"] as Array : [];
         var _loc3_:int = Math.max(_loc2_.length,3);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc4_ < _loc2_.length ? _loc2_[_loc4_] : {
               "type":"",
               "startSec":0
            };
            this.§_-j1D§("type",String(_loc5_["type"]),120,0,param1);
            this.§_-j1D§("startSec",String(_loc5_["startSec"]),90,200,param1);
            param1 += 24;
            _loc4_++;
         }
         return param1;
      }
      
      private function §_-C2X§(param1:int) : int
      {
         var _loc2_:Array = this.§_-71W§["raw"] as Array;
         var _loc3_:String = _loc2_ != null ? _loc2_.join(",") : "";
         this.§_-j1D§("Байты (через запятую)",_loc3_,400,0,param1);
         return param1 + 24;
      }
      
      private function §_-v1D§() : void
      {
         var _loc2_:String = null;
         var _loc1_:int = int(this.§_-Q1a§.text);
         if(this.§_-Z2y§ || _loc1_ > §_-u2n§.§_-gu§)
         {
            _loc2_ = this.§_-Ae§.length > 0 ? this.§_-Ae§[0].text : "";
            this.§_-71W§ = {"raw":this.§_-B15§(_loc2_)};
            return;
         }
         switch(_loc1_)
         {
            case §_-u2n§.§_-r2t§:
               this.§_-Xq§();
               break;
            case §_-u2n§.§_-eS§:
               this.§_-23i§();
               break;
            case §_-u2n§.§_-P1g§:
               this.§_-ir§();
               break;
            case §_-u2n§.§_-M1L§:
               this.§_-71W§ = {"chatState":int(this.§_-Ae§[0].text)};
               break;
            case §_-u2n§.§_-O2m§:
               this.§_-z1E§();
               break;
            case §_-u2n§.§_-gu§:
               this.§_-33o§();
         }
      }
      
      private function §_-Xq§() : void
      {
         this.§_-71W§ = {};
         var _loc1_:int = 0;
         while(_loc1_ < §_-of§.§_-3g§)
         {
            this.§_-71W§[_loc1_] = {
               "class":int(this.§_-Ae§[_loc1_ * 2].text),
               "perk":int(this.§_-Ae§[_loc1_ * 2 + 1].text)
            };
            _loc1_++;
         }
      }
      
      private function §_-23i§() : void
      {
         this.§_-71W§ = {
            "quality":(this.§_-p1X§[0].selected ? 1 : 0),
            "highlight":(this.§_-p1X§[1].selected ? 1 : 0),
            "blackout":(this.§_-p1X§[2].selected ? 1 : 0)
         };
      }
      
      private function §_-ir§() : void
      {
         this.§_-71W§ = {
            "closeout_period":int(this.§_-Ae§[0].text),
            "stock_package":int(this.§_-Ae§[1].text),
            "news_id":int(this.§_-Ae§[2].text)
         };
      }
      
      private function §_-z1E§() : void
      {
         this.§_-71W§ = {};
         var _loc1_:int = 0;
         while(_loc1_ < §_-N10§.§_-X2R§.length)
         {
            this.§_-71W§[§_-N10§.§_-X2R§[_loc1_]] = int(this.§_-Ae§[_loc1_].text);
            _loc1_++;
         }
      }
      
      private function §_-33o§() : void
      {
         var _loc3_:String = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-Ae§.length)
         {
            _loc3_ = this.§_-Ae§[_loc2_].text;
            if(_loc3_ != "")
            {
               _loc1_.push({
                  "type":_loc3_,
                  "startSec":int(this.§_-Ae§[_loc2_ + 1].text)
               });
            }
            _loc2_ += 2;
         }
         this.§_-71W§ = {"seen":_loc1_};
      }
      
      private function §_-B15§(param1:String) : Array
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
      
      private function §_-HE§(param1:String, param2:int, param3:int, param4:int) : TextField
      {
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(new §_-y1B§(param1,0,0,§_-A3G§.§_-v1I§));
         var _loc6_:TextField = new TextField();
         _loc6_.selectable = true;
         _loc6_.mouseEnabled = true;
         §_-j1d§.§_-43I§(_loc6_,_loc5_,_loc5_.width + 2,0,param2,18,100,true);
         _loc5_.x = param3;
         _loc5_.y = param4;
         this.sprite.addChild(_loc5_);
         return _loc6_;
      }
      
      private function §_-j1D§(param1:String, param2:String, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Sprite = new Sprite();
         _loc6_.addChild(new §_-y1B§(param1,0,0,§_-A3G§.§_-v1I§));
         var _loc7_:TextField = new TextField();
         _loc7_.text = param2;
         _loc7_.selectable = true;
         _loc7_.mouseEnabled = true;
         _loc7_.addEventListener(Event.CHANGE,this.§_-B20§);
         §_-j1d§.§_-43I§(_loc7_,_loc6_,_loc6_.width + 2,0,param3,18,100,true);
         _loc6_.x = param4;
         _loc6_.y = param5;
         this.§_-F1S§.addChild(_loc6_);
         this.§_-Ae§.push(_loc7_);
      }
      
      private function §_-w2D§(param1:String, param2:Boolean, param3:int, param4:int) : void
      {
         var _loc5_:CheckBox = new CheckBox();
         _loc5_.label = param1;
         _loc5_.selected = param2;
         _loc5_.x = param3;
         _loc5_.y = param4;
         _loc5_.addEventListener(Event.CHANGE,this.§_-B20§);
         this.§_-F1S§.addChild(_loc5_);
         this.§_-p1X§.push(_loc5_);
      }
      
      private function clearContent() : void
      {
         while(this.§_-F1S§.numChildren > 0)
         {
            this.§_-F1S§.removeChildAt(0);
         }
         this.§_-Ae§ = new Vector.<TextField>(0);
         this.§_-p1X§ = new Vector.<CheckBox>(0);
      }
      
      private function §_-B20§(param1:Event) : void
      {
         this.§_-1R§();
      }
      
      private function §_-1R§() : void
      {
         if(this.§_-z2X§ != null)
         {
            this.§_-z2X§();
         }
      }
   }
}

