package §_-Mq§
{
   import §_-TK§.§_-Z1n§;
   import avmplus.getQualifiedClassName;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.textures.§_-72X§;
   
   public class §_-23h§ extends §_-11l§
   {
      
      private static var _instance:§_-23h§;
      
      private var §_-X1e§:Vector.<Texture> = new Vector.<Texture>();
      
      private var §_-b2j§:Vector.<§_-Z1n§> = new Vector.<§_-Z1n§>();
      
      public function §_-23h§()
      {
         super();
      }
      
      public static function getInstance() : §_-23h§
      {
         if(!_instance)
         {
            _instance = new §_-23h§();
         }
         return _instance;
      }
      
      public function §_-hk§(param1:Texture) : Boolean
      {
         return this.§_-X1e§.indexOf(param1) != -1;
      }
      
      public function §_-e13§(param1:Texture) : void
      {
         while(this.§_-X1e§.indexOf(param1) != -1)
         {
            this.§_-X1e§.splice(this.§_-X1e§.indexOf(param1),1);
         }
      }
      
      private function §_-71E§(param1:Vector.<§_-Z1n§>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(param1[_loc2_] is §_-Z1n§ && param1.length > 0)
            {
               if(param1[_loc2_].item)
               {
                  if(param1[_loc2_].item is SubTexture)
                  {
                     if(Boolean(SubTexture(param1[_loc2_].item).parent) && Boolean(SubTexture(param1[_loc2_].item).parent.base))
                     {
                        SubTexture(param1[_loc2_].item).parent.base.dispose();
                     }
                     SubTexture(param1[_loc2_].item).dispose();
                  }
                  else if(param1[_loc2_].item is §_-72X§)
                  {
                     §_-72X§(param1[_loc2_].item).dispose();
                  }
                  else
                  {
                     param1[_loc2_].item.dispose();
                  }
                  param1[_loc2_] = null;
               }
            }
            _loc2_++;
         }
         param1 = new Vector.<§_-Z1n§>();
      }
      
      public function §_-h18§() : void
      {
         var _loc1_:Texture = null;
         var _loc2_:int = 0;
         var _loc3_:int = int(this.§_-X1e§.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this.§_-X1e§[_loc2_];
            if(_loc1_ is SubTexture)
            {
               if(Boolean(SubTexture(_loc1_).parent) && Boolean(SubTexture(_loc1_).parent.base))
               {
                  SubTexture(_loc1_).parent.base.dispose();
               }
               SubTexture(_loc1_).dispose();
            }
            else if(_loc1_ is §_-72X§)
            {
               §_-72X§(_loc1_).dispose();
            }
            else
            {
               _loc1_.dispose();
            }
            this.§_-X1e§[_loc2_] = null;
            _loc2_++;
         }
         this.§_-X1e§ = new Vector.<Texture>();
         objects = {};
      }
      
      public function §_-V1a§() : void
      {
         this.§_-71E§(this.§_-b2j§);
      }
      
      public function §_-rp§(param1:Texture) : void
      {
         var _loc3_:§_-Z1n§ = null;
         var _loc6_:int = 0;
         var _loc2_:§_-Z1n§ = new §_-Z1n§(null);
         var _loc4_:int = 0;
         var _loc5_:int = int(this.§_-b2j§.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = this.§_-b2j§[_loc4_];
            if(_loc3_ is §_-Z1n§ && Boolean(_loc3_))
            {
               if(_loc3_.item == param1)
               {
                  if(_loc3_.item is SubTexture)
                  {
                     if(Boolean(SubTexture(_loc3_.item).parent) && Boolean(SubTexture(_loc3_.item).parent.base))
                     {
                        SubTexture(_loc3_.item).parent.base.dispose();
                     }
                     SubTexture(_loc3_.item).dispose();
                  }
                  else if(_loc3_.item is §_-72X§)
                  {
                     §_-72X§(_loc3_.item).dispose();
                  }
                  else
                  {
                     _loc3_.item.dispose();
                  }
                  this.§_-b2j§[_loc4_] = _loc2_;
               }
            }
            _loc4_++;
         }
         while(true)
         {
            _loc6_ = this.§_-b2j§.indexOf(_loc2_);
            if(_loc6_ == -1)
            {
               break;
            }
            this.§_-b2j§.splice(_loc6_,1);
         }
      }
      
      public function §_-B2m§(param1:§_-Z1n§) : §_-Z1n§
      {
         this.§_-b2j§.push(param1);
         return param1;
      }
      
      override public function add(param1:String, param2:*, param3:Boolean = true, param4:String = "") : §_-Z1n§
      {
         if(param2 is Texture)
         {
            if(param1 == getQualifiedClassName(Shape) || param1 == getQualifiedClassName(Bitmap))
            {
               return this.§_-B2m§(new §_-Z1n§(param2,true,param4));
            }
            this.§_-X1e§.push(param2);
            return super.add(param1,param2,param3,param4);
         }
         return null;
      }
   }
}

